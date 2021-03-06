{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternGuards #-}
module Folderol.Untyped.Transform.Minimise where

import Folderol.Untyped.Name
import Folderol.Untyped.Network
import Folderol.Untyped.Process

import qualified Folderol.Internal.Haskell as Haskell

import P

import qualified Data.Set as Set
import qualified Data.Map as Map

minimiseNetwork :: NetworkGraph m -> Haskell.Q (NetworkGraph m)
minimiseNetwork graph = do
  procs' <- mapM minimiseProcess $ nProcesses graph
  return $ graph { nProcesses = procs' }

-- TODO: implement Hopcroft minimisation
minimiseProcess :: Process -> Haskell.Q Process
minimiseProcess p = 
  let init   = get $ pInitial p
      instrs = fmap go $ pInstructions p
  in  return $ removeUnreachable p { pInitial = init, pInstructions = instrs }
 where
  get = get' Set.empty

  get' seen (Next l u)
   = case Map.lookup l (pInstructions p) of
    -- TODO: To avoid duplicating work, we can only inline if each parameter is mentioned at most once or is substituted by a variable or value which can be duplicated.
    -- For now, conservatively avoid duplication by making sure variables are unique.
    Just (Info _ (I'Jump (Next l' u')))
     | Just vs <- mapM justVar u'
     , length u' == Set.size (Set.fromList $ Map.elems vs)
     , not $ Set.member l' seen
     -> get' (Set.insert l' seen) (Next l' $ fmap (substVars u) u')
    _
     -> Next l u

  go (Info bs i)
   = Info bs
   $ case i of
      I'Pull c v n n'
       -- We need to be careful with the 'have' part of pull, because it requires 'v' to be an available variable
       -- For now don't minimise that case at all
       -> I'Pull c v n (get n')
      I'Push c e n
       -> I'Push c e (get n)
      I'Jump n
       -> I'Jump (get n)
      I'Bool e n n'
       -> I'Bool e (get n) (get n')
      I'Drop c n
       -> I'Drop c (get n)
      I'Done
       -> I'Done

  justVar (Haskell.VarE v) = Just v
  justVar _ = Nothing

  substVars m e
   | Haskell.VarE k <- e
   , Just v <- Map.lookup (Var k) m
   = v
   | otherwise
   = e

removeUnreachable :: Process -> Process
removeUnreachable p = 
  let Next l _ = pInitial p
      instrs   = go Map.empty [l]
  in  p { pInstructions = instrs }
 where
  go m [] = m
  go m (l:ls)
   | Map.member l m
   = go m ls
   | Just (Info bs i) <- Map.lookup l $ pInstructions p
   = go (Map.insert l (Info bs i) m) (ls <> outlabels i)
   | otherwise
   = go m ls

