/*
 Question - Swap Nodes in Pairs
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3579/
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func swapPairs(_ head: ListNode?) -> ListNode? {
    var dummy = ListNode()
    var prev = dummy
    prev.next = head
    while let cur = prev.next, let next = cur.next {
      cur.next = next.next
      next.next = cur
      prev.next = next
      prev = cur
    }
    
    return dummy.next
  }
}
