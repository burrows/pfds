/// <reference path="../types/jasmine.d.ts" />

import {BinarySearchTree, empty, insert, member} from "../BinarySearchTree";

export default describe('BinarySearchTree', () => {
  describe('member', () => {
    let t1: BinarySearchTree<number> = insert(10, insert(12, insert(3, insert(8, insert(7, insert(9, empty))))));

    it('returns false for an empty tree', () => {
      expect(member(9, empty)).toBe(false);
    });

    it("returns false for a non-empty tree that doesn't contain the given element", () => {
      expect(member(5, t1)).toBe(false);
      expect(member(4, t1)).toBe(false);
      expect(member(15, t1)).toBe(false);
    });

    it('returns true for an element that has been inserted into the tree', () => {
      expect(member(10, t1)).toBe(true);
      expect(member(12, t1)).toBe(true);
      expect(member(3, t1)).toBe(true);
      expect(member(8, t1)).toBe(true);
      expect(member(7, t1)).toBe(true);
      expect(member(9, t1)).toBe(true);
    });
  });
});
