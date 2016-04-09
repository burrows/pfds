export class Empty {
}

export class Cons<T> {
  constructor(public head: T, public tail: Stack<T>) {
  }
}

export type Stack<T> = Empty | Cons<T>;

export function empty<T>(): Stack<T> {
  return new Empty;
}

export function singleton<T>(a: T): Stack<T> {
  return new Cons(a, empty());
}

export function isEmpty<T>(stack: Stack<T>): boolean {
  return stack instanceof Empty;
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

export function toArray<T>(stack: Stack<T>): T[] {
  if (isEmpty(stack)) {
    return [];
  }
  else {
    return [head(stack)].concat(toArray(tail(stack)));
  }
}
