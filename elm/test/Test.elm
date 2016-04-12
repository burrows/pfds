module Test where

import ElmTest exposing (..)

import StackTest
import BinarySearchTreeTest

tests : Test
tests =
  suite "Purely Functional Data Structures"
    [ StackTest.tests
    , BinarySearchTreeTest.tests
    ]

main =
  elementRunner tests
