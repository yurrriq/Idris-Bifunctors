module Data.Test.Bifunctor.Common

%access public export

-- ------------------------------------------------------------------- [ Pairs ]

HelloPair : (Int, String)
HelloPair = (42, "hello world")

GoodbyePair : (Int, String)
GoodbyePair = (43, "goodbye world")

HelloAgainPair : (Int, String)
HelloAgainPair = (44, "hello again world")

GoodbyeAgainPair : (Int, String)
GoodbyeAgainPair = (45, "goodbye again world")

-- ----------------------------------------------------------------- [ Eithers ]

Left43 : Either Int String
Left43 = Left 43

RightGoodbye : Either Int String
RightGoodbye = Right "goodbye world"

RightHello : Either Int String
RightHello = Right "hello world"

-- --------------------------------------------------------------- [ Functions ]

Triple : Int -> Int
Triple = (* 3)

FromJP : String -> String
FromJP a = (++) a " from jp"

-- --------------------------------------------------------------------- [ EOF ]
