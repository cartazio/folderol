{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternGuards #-}
module Folderol.Untyped.Transform.InsertDups where

import Folderol.Untyped.Builtins
import Folderol.Untyped.Name
import Folderol.Untyped.Network
import Folderol.Untyped.Process

import qualified Folderol.Internal.Haskell as Haskell

import P

import qualified Data.Map as Map

import Data.Set (Set)
import qualified Data.Set as Set

-- | Insert duplicator nodes whenever a channel is read by multiple processes.
-- If there is a Sink attached to the original channel, it will stay attached to the same channel
-- (before duplication).
-- If there is a Source attached, the dup process will now pull from it.
-- This does not deal with processes outputting to the same channel: this should not happen
-- since outputs must be unique.
--
-- > as <- map f xs
-- > bs <- map g xs
-- ==>
-- > (xs0, xs1) <- dup2 xs
-- > as <- map f xs0
-- > bs <- map g xs1
--
insertDups :: NetworkGraph m -> Haskell.Q (NetworkGraph m)
insertDups graph = do
  (procs', chans') <- go [] [] $ nProcesses graph
  dupSourceSinks $ graph { nProcesses = procs', nOriginalChannels = nOriginalChannels graph <> chans' }
 where
  go acc chans [] = return (reverse acc, chans)
  go acc chans (p1:ps) 
   -- Check if any later processes use the same input.
   -- Want to keep the proceses in more or less the same order, inserting the
   -- duplicator node just before p1.  This isn't too important, but it means
   -- that if the processes were topologically sorted before, they will be
   -- afterwards.
   --
   -- > ps == before <> [p2] <> after
   | Just (chan, before, p2, after) <- anyIntersect (pInputs p1) [] ps
   = do (dupproc,chan1,chan2) <- dup2 chan
        let p1' = substChannelInput chan chan1 p1
        let p2' = substChannelInput chan chan2 p2 
        let processes = reverse acc <> [dupproc, p1'] <> before <> [p2'] <> after
        go [] (chan1 : chan2 : chans) processes

   -- Continue
   | otherwise
   = go (p1:acc) chans ps

  -- Find a process that uses one of the same input channels,
  -- keeping its relative position in the process list
  anyIntersect :: Set Channel -> [Process] -> [Process]
               -> Maybe (Channel, [Process], Process, [Process])
  anyIntersect _ _ []
   = Nothing
  anyIntersect ins acc (p:ps)
   | Just (chan, _) <- Set.minView $ Set.intersection ins $ pInputs p
   = Just (chan, reverse acc, p, ps)
   | otherwise
   = anyIntersect ins (p : acc) ps


-- | Duplicate when a source and sink use same channel:
-- insert process to loop over source and push into sink.
dupSourceSinks :: NetworkGraph m -> Haskell.Q (NetworkGraph m)
dupSourceSinks g0 = foldM go g0 $ Map.keys $ nSources g0
 where
  go graph c
   | Just snk <- Map.lookup c $ nSinks graph
   = do
    (p,c') <- dup1 c
    return graph
      { nProcesses = nProcesses graph <> [p]
      , nOriginalChannels = nOriginalChannels graph <> [c']
      , nSinks = Map.insert c' snk $ Map.delete c $ nSinks graph
      }
   | otherwise
   = return graph

-- | Rewrite a process to use a different input channel
--
-- > substChannelInput (xs := as) (ys <- map f xs)
-- ==>
-- > ys <- map f as
--
-- This could easily work on outputs too, not sure if that's useful
substChannelInput :: Channel -> Channel -> Process -> Process
substChannelInput cfrom cto proc
 = let inputs = Set.insert cto $ Set.delete cfrom $ pInputs proc 
       instrs = Map.map substInstr $ pInstructions proc
   in proc { pInputs = inputs, pInstructions = instrs }

 where
  substInstr (Info bs i)
   = Info bs
   $ case i of
      I'Pull c v n n'
       -> I'Pull (substChan c) v n n'
      I'Push c e n
       -> I'Push c e n
      I'Jump n
       -> I'Jump n
      I'Bool e n n'
       -> I'Bool e n n'
      I'Drop c n
       -> I'Drop (substChan c) n
      I'Done
       -> I'Done
       

  substChan c
   | c == cfrom
   = cto
   | otherwise
   = c

