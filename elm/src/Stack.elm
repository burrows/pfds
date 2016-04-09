module Stack (Stack, empty, singleton, isEmpty, cons, head, tail, length) where

type Stack a = Empty | Cons a (Stack a)

empty : Stack a
empty = Empty

singleton : a -> Stack a
singleton a =
  Cons a Empty

isEmpty : Stack a -> Bool
isEmpty s =
  case s of
    Empty -> True
    _ -> False

cons : a -> Stack a -> Stack a
cons = Cons

head : Stack a -> Maybe a
head s =
  case s of
    Cons h _ -> Just h
    _ -> Nothing

tail : Stack a -> Maybe (Stack a)
tail s =
  case s of
    Cons _ tail -> Just tail
    _ -> Nothing

length : Stack a -> Int
length = length' 0

length' : Int -> Stack a -> Int
length' n s =
  case s of
    Cons _ tail -> length' (n + 1) tail
    _ -> n
