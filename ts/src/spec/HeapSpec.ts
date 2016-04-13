/// <reference path="../types/jasmine.d.ts" />

import
  { Heap
  , empty
  , insert
  , findMin
  , deleteMin
  , fromList
  } from "../Heap";

export default describe('Stack', () => {
  const h1: Heap<number> = insert(13, insert(21, insert(15, insert(8, insert(2, insert(4, insert(12, empty)))))));

  describe('findMin', () => {
    it('returns the minimum element', () => {
      expect(findMin(h1)).toBe(2);
    });

    it('returns null for an empty heap', () => {
      expect(findMin(empty)).toBeNull();
    });
  });

  describe('deleteMin', () => {
    it('deletes the minimum element', () => {
      expect(findMin(deleteMin(h1))).toBe(4)
      expect(findMin(deleteMin(deleteMin(deleteMin(h1))))).toBe(12)
    });
  });

  describe('fromList', () => {
    it('creates a new Heap with the contents of the list', () => {
      expect(findMin(fromList([12, 4, 7, 8, 3, 9, 6, 5]))).toBe(3);
    });
  });
});
