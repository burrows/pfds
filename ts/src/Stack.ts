class Empty {}

class Cons<T> {
  constructor(public head: T, public tail: Stack<T>) {
    Object.freeze(this);
  }
}

export type Stack<T> = Empty | Cons<T>;

export const empty = new Empty;

export function singleton<T>(a: T): Stack<T> {
  return new Cons(a, empty);
}

export function isEmpty<T>(stack: Stack<T>): boolean {
  return stack === empty;
}

export function cons<T>(a: T, stack: Stack<T>): Stack<T> {
  return new Cons(a, stack);
}

export function head<T>(stack: Stack<T>): T {
  return stack instanceof Cons ? stack.head : null;
}

export function tail<T>(stack: Stack<T>): Stack<T> {
  return stack instanceof Cons ? stack.tail : null;
}

export function length<T>(stack: Stack<T>): number {
  return _length(stack, 0);
}

function _length<T>(stack: Stack<T>, l: number): number {
  return isEmpty(stack) ? l : _length(tail(stack), l + 1);
}

export function toArray<T>(stack: Stack<T>): T[] {
  return _toArray(stack, []);
}

function _toArray<T>(stack: Stack<T>, array: T[]): T[] {
  return isEmpty(stack) ? array : _toArray(tail(stack), array.concat(head(stack)));
}
