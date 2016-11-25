module Data.Test.Bitraversable

import Data.Bitraversable
import Data.Test.Bifunctor.Common

testBitraverse : bitraverse (Just . Show.show) _ Left43 = Just (Left "43")
testBitraverse = Refl

testBisequenceBimap : bisequence (bimap _ (Just . Basics.id) RightGoodbye) =
                      Just (Right "goodbye world")
testBisequenceBimap = Refl

testBimapAccumL : bimapAccumL (\x,_ => (x, 1)) (\x,_ => (x, "two"))
                              True HelloPair =
                  (True, (1, "two"))
testBimapAccumL = Refl

testBimapAccumR : bimapAccumR (\x,_ => (x, 1)) (\x,_ => (x, "two"))
                              True HelloPair =
                  (True, (1, "two"))
testBimapAccumR = Refl
