/*
 Question - Linked List Random Node
 Link - > https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3552/
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
  
  var head: ListNode?
  
  init(_ head: ListNode?) {
    self.head = head
  }
  
  func getRandom() -> Int {
    var value = 0
    var curr = head
    var count = 0
    
    while curr != nil {
      count += 1
      if Int.random(in: 0..<count) == 0 {
        value = curr!.val
      }
      curr = curr!.next
    }
    
    return value
  }
}
