module Heap (Heap, empty, insert, findMin, deleteMin) where

type Heap comparable = Empty | Node Int comparable (Heap comparable) (Heap comparable)

empty : Heap comparable
empty = Empty

merge : Heap comparable -> Heap comparable -> Heap comparable
merge h1 h2 =
  case (h1, h2) of
    (h, Empty) -> h
    (Empty, h) -> h
    ((Node _ x a1 b1), (Node _ y a2 b2)) ->
      if x <= y then
        makeNode x a1 (merge b1 h2)
      else
        makeNode y a2 (merge h1 b2)

rank : Heap comparable -> Int
rank h =
  case h of
    Empty -> 0
    Node r _ _ _ -> r

makeNode : comparable -> Heap comparable -> Heap comparable -> Heap comparable
makeNode x a b =
  if (rank a) >= (rank b) then
    Node ((rank b) + 1) x a b
  else
    Node ((rank a) + 1) x b a

insert : comparable -> Heap comparable -> Heap comparable
insert x h =
  merge (Node 1 x Empty Empty) h

findMin : Heap comparable -> Maybe comparable
findMin h =
  case h of
    Empty -> Nothing
    Node _ x _ _ -> Just x

deleteMin : Heap comparable -> Heap comparable
deleteMin h =
  case h of
    Empty -> h
    Node _ _ a b -> merge a b

