module StackTest where

import ElmTest exposing (..)

import Stack exposing (..)

tests : Test
tests =
  suite "Stack"
    [ test "isEmpty returns True for an empty stack" <|
        assertEqual True (isEmpty empty)
    , test "isEmpty returns False for a non-empty stack" <|
        assertEqual False (isEmpty (singleton 9))
    , test "singleton returns a 1 item stack with the given item" <|
        assertEqual (cons 9 empty) (singleton 9)
    , test "head returns Nothing on an empty stack" <|
        assertEqual Nothing (head empty)
    , test "head returns the item on the top of a singleton stack" <|
        assertEqual (Just 3) (head (singleton 3))
    , test "head returns the item on the top of a multi item stack" <|
        assertEqual (Just 1) (head (cons 1 (cons 2 (cons 3 empty))))
    , test "tail returns Nothing on an empty stack" <|
        assertEqual Nothing (tail empty)
    , test "tail returns Empty a singleton stack" <|
        assertEqual (Just empty) (tail (singleton 4))
    , test "tail returns all but the first item of a multi item stack" <|
        assertEqual (Just ((cons 2 (cons 3 empty)))) (tail (cons 1 (cons 2 (cons 3 empty))))
    , test "length returns 0 for an empty stack" <|
        assertEqual 0 (length empty)
    , test "length returns 1 for a singleton stack" <|
        assertEqual 1 (length (singleton 3))
    , test "length returns the length of the stack" <|
        assertEqual 3 (length (cons 3 (cons 2 (cons 1 empty))))
    ]
