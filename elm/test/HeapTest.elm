module HeapTest where

import ElmTest exposing (..)

import Heap exposing (..)

h1 = empty |> insert 12 |> insert 4 |> insert 2 |> insert 8 |> insert 15 |> insert 21 |> insert 13

tests : Test
tests =
  suite "Heap"
    [ test "findMin returns the minimum element" <|
        assertEqual (Just 2) (findMin h1)
    , test "findMin returns Nothing on an empty heap" <|
        assertEqual Nothing (findMin empty)
    , test "deleteMin deletes the minimum element 1" <|
        assertEqual (Just 4) (deleteMin h1 |> findMin)
    , test "deleteMin deletes the minimum element 2" <|
        assertEqual (Just 12) (deleteMin h1 |> deleteMin |> deleteMin |> findMin)
    ]
