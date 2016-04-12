class Empty {}

class Tree<T> {
  constructor(public left: BinarySearchTree<T>, public elem: T, public right: BinarySearchTree<T>) {
    Object.freeze(this);
  }
}

export type BinarySearchTree<T> = Empty | Tree<T>;

export const empty = new Empty;

export function member<T>(x: T, tree: BinarySearchTree<T>): boolean {
  if (tree instanceof Empty) {
    return false;
  }
  else if (tree instanceof Tree) {
    if (x < tree.elem) {
      return member(x, tree.left);
    }
    else if (x > tree.elem) {
      return member(x, tree.right);
    }
    else {
      return true;
    }
  }
}

export function insert<T>(x: T, tree: BinarySearchTree<T>): BinarySearchTree<T> {
  if (tree instanceof Empty) {
    return new Tree(empty, x, empty);
  }
  else if (tree instanceof Tree) {
    if (x < tree.elem) {
      return new Tree(insert(x, tree.left), tree.elem, tree.right);
    }
    else if (x > tree.elem) {
      return new Tree(tree.left, tree.elem, insert(x, tree.right));
    }
    else {
      return tree;
    }
  }
}
