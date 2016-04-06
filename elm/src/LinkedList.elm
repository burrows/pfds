module LinkedList (foo, tests, main) where

import ElmTest exposing (..)

foo =
  9

----------------------------------------------------------------------------------------------------
-- Tests
----------------------------------------------------------------------------------------------------
tests : () -> Test
tests _ =
  suite "LinkedList"
    [ test "foo" <| assertEqual 9 foo
    ]

main =
  elementRunner (tests ())
