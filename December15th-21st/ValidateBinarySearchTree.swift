/*
 Question - Validate Binary Search Tree
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3568/
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
  func isValidBST(_ root: TreeNode?) -> Bool{
    return isValidBSTHelper(root, Int.min, Int.max)
  }
  
  func isValidBSTHelper(_ root: TreeNode?,_ min: Int?,_ max: Int?) -> Bool{
    guard let root = root else { return true }
    if let min = min, root.val <= min { return false }
    if let max = max, root.val >= max { return false }
    return isValidBSTHelper(root.left, min, root.val) && isValidBSTHelper(root.right, root.val, max)
  }
}
