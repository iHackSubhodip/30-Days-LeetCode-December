/*
 Question - Populating Next Right Pointers in Each Node II
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3556/
 */

public class Node {
  public var val: Int
  public var left: Node?
  public var right: Node?
  public var next: Node?
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
    self.next = nil
  }
}


class Solution {
  func connect(_ root: Node?) -> Node? {
    dfs(root)
    return root
  }
  
  func dfs(_ root: Node?) {
    guard let root = root else {
      return
    }
    
    
    if let right = root.right {
      right.next = getNext(root)
      dfs(right)
    }
    
    if let left = root.left {
      left.next = root.right ?? getNext(root)
      dfs(left)
    }
  }
  
  func getNext(_ root: Node?) -> Node? {
    var parent = root
    
    while parent?.next != nil {
      if let left = parent?.next?.left {
        return left
      } else if let right = parent?.next?.right {
        return right
      } else {
        parent = parent?.next
      }
    }
    return nil
  }
}
