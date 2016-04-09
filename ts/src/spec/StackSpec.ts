/// <reference path="../types/jasmine.d.ts" />

import
  { Stack
  , empty
  , singleton
  , isEmpty
  , cons
  , head
  , tail
  , length
  , toArray
  } from "../Stack";

export default describe('Stack', () => {
  describe('isEmpty', () => {
    it('returns true for the empty stack', () => {
      expect(isEmpty(empty)).toBe(true);
    });

    it('returns false for a non-empty stack', () => {
      expect(isEmpty(singleton(3))).toBe(false);
    });
  });

  describe('singleton', () => {
    it('returns a 1 item stack with the given item', () => {
      expect(singleton(9)).toEqual(cons(9, empty));
    });
  });

  describe('head', () => {
    it('returns null on an empty stack', () => {
      expect(head(empty)).toBeNull();
    });

    it('returns the item on the top of a singleton stack', () => {
      expect(head(singleton(9))).toBe(9);
    });

    it('returns the item on the top of a multi item stack', () => {
      expect(head(cons(1, cons(2, cons(3, empty))))).toBe(1);
    });
  });

  describe('tail', () => {
    it('returns null on an empty stack', () => {
      expect(tail(empty)).toBeNull();
    });

    it('returns empty on a singleton stack', () => {
      expect(tail(singleton(9))).toBe(empty);
    });

    it('returns all but the first item of a multi item stack', () => {
      expect(tail(cons(1, cons(2, cons(3, empty))))).toEqual(cons(2, cons(3, empty)));
    });
  });

  describe('toArray', () => {
    it('returns an empty array when given an empty stack', () => {
      expect(toArray(empty)).toEqual([]);
    });

    it('returns an array containing the item in a singleton stack', () => {
      expect(toArray(singleton(4))).toEqual([4]);
    });

    it('returns an array containing all items of a multi-item stack', () => {
      expect(toArray(cons(1, cons(2, cons(3, empty))))).toEqual([1, 2, 3]);
    });
  });

  describe('length', () => {
    it('returns the length of the stack', () => {
      expect(length(empty)).toBe(0);
      expect(length(singleton(4))).toBe(1);
      expect(length(cons(1, cons(2, cons(3, singleton(4)))))).toBe(4);
    });
  });
});
