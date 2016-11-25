module Data.Test.Bifunctor.Apply

import Data.Bifunctor.Apply
import Data.Test.Bifunctor.Common

testBiapply : (Triple, FromJP) <<.>> HelloPair = (42 * 3, "hello world from jp")
testBiapply = Refl

testBisequenceLeft : HelloPair <<. GoodbyePair = HelloPair
testBisequenceLeft = Refl

testBisequenceRight : HelloPair .>> GoodbyePair = GoodbyePair
testBisequenceRight = Refl

testLift2 : bilift2 (+) (++) HelloPair GoodbyePair =
            (42 + 43, "hello worldgoodbye world")
testLift2 = Refl

testLift3 : bilift3 (\x,y,z => x + y + z) (\x,y,z => x ++ y ++ z)
                 HelloPair GoodbyePair HelloAgainPair =
            (42 + 43 + 44, "hello worldgoodbye worldhello again world")
testLift3 = Refl

testBiapplySecond : HelloPair <<..>> (Triple, FromJP) =
                    (42 * 3, "hello world from jp")
testBiapplySecond = Refl
