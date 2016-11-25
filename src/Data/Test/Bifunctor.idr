module Data.Test.Bifunctor

import Data.Bifunctor
import Data.Test.Bifunctor.Common

testFirstSecond : (first Triple . second FromJP) Left43 =
                  bimap Triple FromJP Left43
testFirstSecond = Refl

testFirstLeft : first Triple Left43 = Left (43 * 3)
testFirstLeft = Refl

testFirstRight : first Triple RightHello = RightHello
testFirstRight = Refl

testSecondLeft : second FromJP Left43 = Left43
testSecondLeft = Refl

testSecondRight : second FromJP RightHello = Right "hello world from jp"
testSecondRight = Refl

testBimap : bimap Triple FromJP HelloPair = ((42 * 3), "hello world from jp")
testBimap = Refl
