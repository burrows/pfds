module BinarySearchTree (Tree, empty, member, insert) where

type Tree comparable = Empty | Tree (Tree comparable) comparable (Tree comparable)

empty : Tree comparable
empty = Empty

member : comparable -> Tree comparable -> Bool
member x tree =
  case tree of
    Empty ->
      False
    Tree a y b ->
      if x < y then
        member x a
      else if x > y then
        member x b
      else
        True

insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
  case tree of
    Empty ->
      Tree Empty x Empty
    Tree a y b ->
      if x < y then
        Tree (insert x a) y b
      else if x > y then
        Tree a y (insert x b)
      else
        tree

