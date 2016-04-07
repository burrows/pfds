module Test where

import ElmTest exposing (..)

import Stack

tests : Test
tests =
  suite "Purely Functional Data Structures"
    [ Stack.tests ()
    ]

main =
  elementRunner tests
