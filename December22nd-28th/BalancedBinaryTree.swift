/*
 Question - Balanced Binary Tree
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3577/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right =  nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func isBalanced(_ root: TreeNode?) -> Bool {
    if root == nil { return true }
    return abs(height(root?.left) - height(root?.right)) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
  }
  
  private func height(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    return 1 + max(height(root?.left), height(root?.right))
  }
}
