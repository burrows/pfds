module Test where

import ElmTest exposing (..)

import StackTest

tests : Test
tests =
  suite "Purely Functional Data Structures"
    [ StackTest.tests
    ]

main =
  elementRunner tests
