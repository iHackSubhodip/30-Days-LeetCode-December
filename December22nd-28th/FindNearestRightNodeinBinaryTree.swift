/*
 Question - Find Nearest Right Node in Binary Tree
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3576/
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
  var foundLevel = -1
  
  func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
    if root == nil || u == nil {
      return nil
    }
    return dfs(root!, u!.val, 0)
  }
  
  func dfs(_ root: TreeNode, _ target: Int, _ level: Int) -> TreeNode? {
    if foundLevel == level {
      return root
    }
    if root.val == target {
      foundLevel = level
    }
    if root.left != nil {
      if let val = dfs(root.left!, target, level + 1) {
        return val
      }
    }
    if root.right != nil {
      if let val = dfs(root.right!, target, level + 1) {
        return val
      }
    }
    return nil
  }
}
