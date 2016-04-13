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
    , test "fromList creates a new Heap with the contents of the list 1" <|
        assertEqual (Just 3) (fromList [12, 4, 7, 8, 3, 9, 6, 5] |> findMin)
    , test "fromList creates a new Heap with the contents of the list 1" <|
        assertEqual (Just 5) (fromList [12, 4, 7, 8, 3, 9, 6, 5] |> deleteMin |> deleteMin |> findMin)
    ]
