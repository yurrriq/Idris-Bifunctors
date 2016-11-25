module Data.Test.Bimonad

import Data.Bimonad
import Data.Test.Bifunctor.Common

testBiunit : biunit 42 "hello world" = (HelloPair, HelloPair)
testBiunit = Refl

testBijoin : bijoin ((HelloPair, GoodbyePair),
                     (HelloAgainPair, GoodbyeAgainPair)) =
             ((42, "hello world"), (45, "goodbye again world"))
testBijoin = Refl

testBibind : (HelloPair, GoodbyePair) >>== (flip MkPair "hi", MkPair 46) =
             ((42, "hi"), (46, "goodbye world"))
testBibind = Refl
