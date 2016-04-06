module Test where

import ElmTest exposing (..)

import LinkedList

tests : Test
tests =
  suite "Purely Functional Data Structures"
    [ LinkedList.tests ()
    ]

main =
  elementRunner tests
