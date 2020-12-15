/*
 Question - Plus One Linked List
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3566/
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func plusOne(_ head: ListNode?) -> ListNode? {
    guard let head = head else { return nil }
    
    let res = plusOne(head)
    if res.1 == 0 {
      return res.0
    } else {
      var node = ListNode(1)
      node.next = res.0
      return node
    }
  }
  
  func plusOne(_ head: ListNode) -> (ListNode?, Int) {
    if head.next == nil {
      return (ListNode((head.val + 1) % 10), (head.val + 1) / 10)
    }
    
    let next = plusOne(head.next!)
    let node = ListNode((head.val + next.1) % 10)
    node.next = next.0
    
    return (node, (head.val + next.1) / 10)
  }
}
