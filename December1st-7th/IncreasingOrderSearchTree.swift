/*
 Question - Increasing Order Search Tree
 Link - > https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3553/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right =  nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right:TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  var previous: TreeNode?, head: TreeNode?
  
  func increasingBST(_ root: TreeNode?) -> TreeNode? {
    guard let r = root else { return nil }
    increasingBST(r.left)
    if head == nil { head = r }
    r.left = nil
    previous?.right = r
    previous = r
    increasingBST(r.right)
    return head
  }
}
