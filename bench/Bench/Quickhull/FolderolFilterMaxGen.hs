-- This is the code generated by Folderol for filterMax.
-- Aside from pretty-printing and namespace issues, it is the same as produced by compiling the Folderol version with -ddump-splices
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Bench.Quickhull.FolderolFilterMaxGen where

import Bench.Plumbing.Folderol
import Bench.Quickhull.Skeleton

import Folderol
import Folderol.Splice

import GHC.Types (SPEC(..))
import Folderol.Sink (Sink(..))
import Folderol.Source (Source(..), sourceOfVector)

import qualified Folderol.Source as Source

import qualified Data.Vector.Unboxed as Unbox

import Prelude hiding (filter, map)

import System.IO.Unsafe


{-# INLINE filterMax #-}
filterMax :: Line -> Unbox.Vector Point -> (Point, Unbox.Vector Point)
filterMax l vec = unsafeDupablePerformIO $ do
 (maxim,(above,())) <- scalarIO $ \snkMaxim -> vectorAtMostIO (Unbox.length vec) $ \snkAbove -> do
    case snkAbove of {
      Sink map_out_6989586621680202622_init
           map_out_6989586621680202622_push
           map_out_6989586621680202622_done
        -> case snkMaxim of {
             Sink fold_out_6989586621680202643_init
                  fold_out_6989586621680202643_push
                  fold_out_6989586621680202643_done
               -> case sourceOfVector vec of {
                    Source source_6989586621680202569_init
                           source_6989586621680202569_pull
                           source_6989586621680202569_done
                      -> let
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L0_0_n_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             = case fold_var of {
                                 _ -> (>>=)
                                        (source_6989586621680202569_pull
                                           source_6989586621680202569_state)
                                        (\ ((,) !pulled !source_6989586621680202569_state')
                                           -> case pulled of {
                                                Just val
                                                  -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L1_0_n_0_n
                                                       SPEC
                                                       source_6989586621680202569_state'
                                                       map_out_6989586621680202622_state
                                                       fold_out_6989586621680202643_state
                                                       val
                                                       fold_var;
                                                Nothing
                                                  -> fold_L2_0_map_L3_0_filter_L4_0_c_0_dup2_L4_0_c_0_map_L3_0_c_0_c
                                                       SPEC
                                                       source_6989586621680202569_state'
                                                       map_out_6989586621680202622_state
                                                       fold_out_6989586621680202643_state
                                                       fold_var }) }
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L1_0_n_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !map_var
                             !fold_var
                             = case fold_var of {
                                 _ -> case map_var of {
                                        _ -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L2_0_h_0_n
                                               SPEC
                                               source_6989586621680202569_state
                                               map_out_6989586621680202622_state
                                               fold_out_6989586621680202643_state
                                               fold_var
                                               ((\ p -> (p, distance p l)) map_var) } }
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L2_0_h_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             !map_out_6989586621680202574
                             = case map_out_6989586621680202574 of {
                                 _ -> case fold_var of {
                                        _ -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L1_0_n_0_map_L2_0_h_0_n
                                               SPEC
                                               source_6989586621680202569_state
                                               map_out_6989586621680202622_state
                                               fold_out_6989586621680202643_state
                                               fold_var
                                               map_out_6989586621680202574
                                               map_out_6989586621680202574 } }
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L1_0_n_0_map_L2_0_h_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             !var
                             !map_out_6989586621680202574
                             = case map_out_6989586621680202574 of {
                                 _ -> case var of {
                                        _ -> case fold_var of {
                                               _ -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                                                      SPEC
                                                      source_6989586621680202569_state
                                                      map_out_6989586621680202622_state
                                                      fold_out_6989586621680202643_state
                                                      fold_var
                                                      var
                                                      var
                                                      map_out_6989586621680202574 } } }
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             !var
                             !dup_6989586621680202669
                             !map_out_6989586621680202574
                             = case map_out_6989586621680202574 of {
                                 _ -> case dup_6989586621680202669 of {
                                        _ -> case var of {
                                               _ -> case fold_var of {
                                                      _ -> fold_L0_0_map_L0_0_filter_L1_0_n_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                                                             SPEC
                                                             source_6989586621680202569_state
                                                             map_out_6989586621680202622_state
                                                             fold_out_6989586621680202643_state
                                                             dup_6989586621680202669
                                                             fold_var
                                                             var
                                                             dup_6989586621680202669
                                                             map_out_6989586621680202574 } } } }
                           fold_L0_0_map_L0_0_filter_L1_0_n_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !filter_var
                             !fold_var
                             !var
                             !dup_6989586621680202669
                             !map_out_6989586621680202574
                             = case map_out_6989586621680202574 of {
                                 _ -> case dup_6989586621680202669 of {
                                        _ -> case var of {
                                               _ -> case fold_var of {
                                                      _ -> case filter_var of {
                                                             _ -> if (\ (_, d) -> (d > 0))
                                                                       filter_var then
                                                                      fold_L0_0_map_L0_0_filter_L3_0_h_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                                                                        SPEC
                                                                        source_6989586621680202569_state
                                                                        map_out_6989586621680202622_state
                                                                        fold_out_6989586621680202643_state
                                                                        fold_var
                                                                        var
                                                                        filter_var
                                                                        dup_6989586621680202669
                                                                        map_out_6989586621680202574
                                                                  else
                                                                      fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L3_0_n_0_map_L2_0_h_0_h
                                                                        SPEC
                                                                        source_6989586621680202569_state
                                                                        map_out_6989586621680202622_state
                                                                        fold_out_6989586621680202643_state
                                                                        fold_var
                                                                        map_out_6989586621680202574
                                                                        var } } } } }
                           fold_L0_0_map_L0_0_filter_L3_0_h_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             !var
                             !filter_out_6989586621680202597
                             !dup_6989586621680202669
                             !map_out_6989586621680202574
                             = case map_out_6989586621680202574 of {
                                 _ -> case dup_6989586621680202669 of {
                                        _ -> case filter_out_6989586621680202597 of {
                                               _ -> case var of {
                                                      _ -> case fold_var of {
                                                             _ -> fold_L0_0_map_L1_0_filter_L3_0_h_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                                                                    SPEC
                                                                    source_6989586621680202569_state
                                                                    map_out_6989586621680202622_state
                                                                    fold_out_6989586621680202643_state
                                                                    filter_out_6989586621680202597
                                                                    fold_var
                                                                    var
                                                                    filter_out_6989586621680202597
                                                                    dup_6989586621680202669
                                                                    map_out_6989586621680202574 } } } } }
                           fold_L0_0_map_L1_0_filter_L3_0_h_0_dup2_L2_0_h_0_map_L2_0_h_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !map_var
                             !fold_var
                             !var
                             !filter_out_6989586621680202597
                             !dup_6989586621680202669
                             !map_out_6989586621680202574
                             = case map_out_6989586621680202574 of {
                                 _ -> case dup_6989586621680202669 of {
                                        _ -> case filter_out_6989586621680202597 of {
                                               _ -> case var of {
                                                      _ -> case fold_var of {
                                                             _ -> case map_var of {
                                                                    _ -> (>>=)
                                                                           (map_out_6989586621680202622_push
                                                                              map_out_6989586621680202622_state
                                                                              (fst map_var))
                                                                           (\ !map_out_6989586621680202622_state'
                                                                              -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L3_0_n_0_map_L2_0_h_0_h
                                                                                   SPEC
                                                                                   source_6989586621680202569_state
                                                                                   map_out_6989586621680202622_state'
                                                                                   fold_out_6989586621680202643_state
                                                                                   fold_var
                                                                                   map_out_6989586621680202574
                                                                                   var) } } } } } }
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L3_0_n_0_map_L2_0_h_0_h
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             !map_out_6989586621680202574
                             !dup_6989586621680202670
                             = case dup_6989586621680202670 of {
                                 _ -> case map_out_6989586621680202574 of {
                                        _ -> case fold_var of {
                                               _ -> fold_L1_0_map_L0_0_filter_L0_0_n_0_dup2_L3_0_n_0_map_L2_0_h_0_h
                                                      SPEC
                                                      source_6989586621680202569_state
                                                      map_out_6989586621680202622_state
                                                      fold_out_6989586621680202643_state
                                                      dup_6989586621680202670
                                                      fold_var
                                                      map_out_6989586621680202574
                                                      dup_6989586621680202670 } } }
                           fold_L1_0_map_L0_0_filter_L0_0_n_0_dup2_L3_0_n_0_map_L2_0_h_0_h
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             !fold_var'
                             !map_out_6989586621680202574
                             !dup_6989586621680202670
                             = case dup_6989586621680202670 of {
                                 _ -> case map_out_6989586621680202574 of {
                                        _ -> case fold_var of {
                                               _ -> case fold_var' of {
                                                      _ -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L2_0_n_0_n
                                                             SPEC
                                                             source_6989586621680202569_state
                                                             map_out_6989586621680202622_state
                                                             fold_out_6989586621680202643_state
                                                             (maxBy fold_var fold_var') } } } }
                           fold_L2_0_map_L3_0_filter_L4_0_c_0_dup2_L4_0_c_0_map_L3_0_c_0_c
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             = case fold_var of {
                                 _ -> (>>=)
                                        (fold_out_6989586621680202643_push
                                           fold_out_6989586621680202643_state fold_var)
                                        (\ !fold_out_6989586621680202643_state'
                                           -> fold_L3_0_map_L3_0_filter_L4_0_c_0_dup2_L4_0_c_0_map_L3_0_c_0_c
                                                SPEC
                                                source_6989586621680202569_state
                                                map_out_6989586621680202622_state
                                                fold_out_6989586621680202643_state') }
                           fold_L3_0_map_L3_0_filter_L4_0_c_0_dup2_L4_0_c_0_map_L3_0_c_0_c
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             = (>>)
                                 (fold_out_6989586621680202643_done
                                    fold_out_6989586621680202643_state)
                                 ((>>)
                                    (map_out_6989586621680202622_done
                                       map_out_6989586621680202622_state)
                                    ((>>)
                                       (source_6989586621680202569_done
                                          source_6989586621680202569_state)
                                       (return ())))
                           fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L2_0_n_0_n
                             SPEC
                             !source_6989586621680202569_state
                             !map_out_6989586621680202622_state
                             !fold_out_6989586621680202643_state
                             !fold_var
                             = case fold_var of {
                                 _ -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L0_0_n_0_n
                                        SPEC
                                        source_6989586621680202569_state
                                        map_out_6989586621680202622_state
                                        fold_out_6989586621680202643_state
                                        fold_var }
                         in
                           (>>=)
                             source_6989586621680202569_init
                             (\ !source_6989586621680202569_state
                                -> (>>=)
                                     map_out_6989586621680202622_init
                                     (\ !map_out_6989586621680202622_state
                                        -> (>>=)
                                             fold_out_6989586621680202643_init
                                             (\ !fold_out_6989586621680202643_state
                                                -> fold_L0_0_map_L0_0_filter_L0_0_n_0_dup2_L0_0_n_0_map_L0_0_n_0_n
                                                     SPEC
                                                     source_6989586621680202569_state
                                                     map_out_6989586621680202622_state
                                                     fold_out_6989586621680202643_state
                                                     ((0, 0), negInf)))) } } }

 return (fst maxim, above)
 where
  {-# INLINE maxBy #-}
  maxBy = \((!x1,!y1),!d1) ((!x2,!y2),!d2) -> if d1 > d2 then ((x1,y1),d1) else ((x2,y2),d2)
  {-# INLINE negInf #-}
  negInf = -1 / 0

