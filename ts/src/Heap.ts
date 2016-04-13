class Empty {}

class Node<T> {
  constructor(public rank: number, public elem: T, public left: Heap<T>, public right: Heap<T>) {
    Object.freeze(this);
  }
}

export type Heap<T> = Empty | Node<T>;

export const empty = new Empty;

function merge<T>(h1: Heap<T>, h2: Heap<T>): Heap<T> {
  if (h1 instanceof Node && h2 instanceof Node) {
    return h1.elem < h2.elem ?
      makeNode(h1.elem, h1.left, merge(h1.right, h2)) :
      makeNode(h2.elem, h2.left, merge(h1, h2.right));
  }
  else if (h1 instanceof Empty) {
    return h2;
  }
  else {
    return h1;
  }
}

function rank<T>(h: Heap<T>): number {
  return h instanceof Node ? h.rank : 0;
}

function makeNode<T>(x: T, a: Heap<T>, b: Heap<T>): Heap<T> {
  return rank(a) >= rank(b) ?
    new Node(rank(b) + 1, x, a, b) :
    new Node(rank(a) + 1, x, b, a);
}

export function insert<T>(x: T, h: Heap<T>): Heap<T> {
  return merge(new Node(1, x, empty, empty), h);
}

export function findMin<T>(h: Heap<T>): T {
  return h instanceof Node ? h.elem : null;
}

export function deleteMin<T>(h: Heap<T>): Heap<T> {
  return h instanceof Node ? merge(h.left, h.right) : h;
}

export function fromList<T>(list: T[]): Heap<T> {
  return list.reduce(((h, x) => insert(x, h)), empty);
}

