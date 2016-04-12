module BinarySearchTreeTest where

import ElmTest exposing (..)

import BinarySearchTree exposing (..)

t1 = insert 9 empty |> insert 7 |> insert 8 |> insert 3 |> insert 12 |> insert 10

tests : Test
tests =
  suite "BinarySearchTree"
    [ test "member returns False for an empty tree" <|
        assertEqual False (member 9 empty)
    , test "member returns false for a non-empty tree that doesn't contain the given element 1" <|
        assertEqual False (member 5 t1)
    , test "member returns false for a non-empty tree that doesn't contain the given element 2" <|
        assertEqual False (member 4 t1)
    , test "member returns false for a non-empty tree that doesn't contain the given element 3" <|
        assertEqual False (member 15 t1)
    , test "member returns true for an element that has been inserted into the tree 1" <|
        assertEqual True (member 10 t1)
    , test "member returns true for an element that has been inserted into the tree 2" <|
        assertEqual True (member 12 t1)
    , test "member returns true for an element that has been inserted into the tree 3" <|
        assertEqual True (member 3 t1)
    , test "member returns true for an element that has been inserted into the tree 4" <|
        assertEqual True (member 8 t1)
    , test "member returns true for an element that has been inserted into the tree 5" <|
        assertEqual True (member 7 t1)
    , test "member returns true for an element that has been inserted into the tree 6" <|
        assertEqual True (member 9 t1)
    ]
