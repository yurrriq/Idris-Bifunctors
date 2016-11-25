module Data.Test.Biapplicative

import Data.Biapplicative
import Data.Test.Bifunctor.Common

testBipure : bipure 42 "hello world" = (42, "hello world")
testBipure = Refl

testBiapply1 : ((Triple, FromJP) <<*>> HelloPair) =
              ((42 * 3), "hello world from jp")
testBiapply1 = Refl

testBiapply2 : HelloPair <<**>> (Triple, FromJP) =
               ((42 * 3), "hello world from jp")
testBiapply2 = Refl

testBisequenceLeft : (HelloPair <<* GoodbyePair) = HelloPair
testBisequenceLeft = Refl

testBisequenceRight : (HelloPair *>> GoodbyePair) = GoodbyePair
testBisequenceRight = Refl
