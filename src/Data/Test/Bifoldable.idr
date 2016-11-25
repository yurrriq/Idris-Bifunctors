module Data.Test.Bifoldable

import Data.Bifoldable
import Data.Test.Bifunctor.Common

testBifoldMap : bifoldMap Show.show Basics.id Left43 = "43"
testBifoldMap = Refl

testBifoldr : bifoldr (\x,y => show x ++ y) (++) "" RightGoodbye =
              "goodbye world"
testBifoldr = Refl

testBifoldl : bifoldl (\x,y => x ++ show y) (++) "" HelloPair =
              "hello world42"
testBifoldl = Refl

testBifold : bifold ("one", "two") = "onetwo"
testBifold = Refl

testBifoldrM : bifoldrM (\x,y => Just ((show x) ++ y))
                        (\x,y => Just (x ++ y)) "" HelloPair =
               Just "hello world42"
testBifoldrM = Refl

testBifoldlM : bifoldlM (\x,y => Just (x ++ (show y)))
                        (\x,y => Just (x ++ y)) "" HelloPair =
               Just "hello world42"
testBifoldlM = Refl

testTraverse_ : bitraverse_ Just Just HelloPair = Just ()
testTraverse_ = Refl

testBimapM_ : bimapM_ Just Just HelloPair = Just ()
testBimapM_ = Refl

testBisequence_ : bisequence_ (Just 1, Just "two") = Just ()
testBisequence_ = Refl

testBiList : biList (1, 2) = [2,1]
testBiList = Refl

testBiconcat : biconcat ([1], [2]) = [1,2]
testBiconcat = Refl

testBiconcatMap : biconcatMap (\x => [show x]) (\x => [x]) HelloPair =
                  ["42", "hello world"]
testBiconcatMap = Refl

testBiany : biany ((==) 42) ((==) "goodbye world") HelloPair = True
testBiany = Refl

testBiall : biall ((==) 42) ((==) "goodbye world") HelloPair = False
testBiall = Refl
