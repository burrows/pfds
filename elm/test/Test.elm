module Test where

import ElmTest exposing (..)

import StackTest
import BinarySearchTreeTest
import HeapTest

tests : Test
tests =
  suite "Purely Functional Data Structures"
    [ StackTest.tests
    , BinarySearchTreeTest.tests
    , HeapTest.tests
    ]

main =
  elementRunner tests
