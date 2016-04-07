module Stack where

import ElmTest exposing (..)

type Stack a = Empty | Cons a (Stack a)

empty : Stack a
empty = Empty

singleton : a -> Stack a
singleton a =
  Cons a Empty

isEmpty : Stack a -> Bool
isEmpty s =
  case s of
    Empty -> True
    _ -> False

cons : a -> Stack a -> Stack a
cons = Cons

head : Stack a -> Maybe a
head s =
  case s of
    Cons h _ -> Just h
    _ -> Nothing

tail : Stack a -> Maybe (Stack a)
tail s =
  case s of
    Cons _ tail -> Just tail
    _ -> Nothing

----------------------------------------------------------------------------------------------------
-- Tests
----------------------------------------------------------------------------------------------------
tests : () -> Test
tests _ =
  suite "Stack"
    [ test "empty returns Empty" <|
        assertEqual Empty empty
    , test "isEmpty returns True for an empty stack" <|
        assertEqual True (isEmpty empty)
    , test "isEmpty returns False for a non-empty stack" <|
        assertEqual False (isEmpty (singleton 9))
    , test "singleton returns a 1 item stack with the given item" <|
        assertEqual (Cons 9 Empty) (singleton 9)
    , test "head returns Nothing on an empty stack" <|
        assertEqual Nothing (head empty)
    , test "head returns the item on the top of a singleton stack" <|
        assertEqual (Just 3) (head (singleton 3))
    , test "head returns the item on the top of a multi item stack" <|
        assertEqual (Just 1) (head (Cons 1 (Cons 2 (Cons 3 Empty))))
    , test "tail returns Nothing on an empty stack" <|
        assertEqual Nothing (tail empty)
    , test "tail returns Empty a singleton stack" <|
        assertEqual (Just Empty) (tail (singleton 4))
    , test "tail returns all but the first item of a multi item stack" <|
        assertEqual (Just ((Cons 2 (Cons 3 Empty)))) (tail (Cons 1 (Cons 2 (Cons 3 Empty))))
    ]
