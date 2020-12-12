/*
 Question - Smallest Subtree with all the Deepest Nodes
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3563/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right=  nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

class Solution {
  func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
    return deep(root).1
  }
  
  func deep(_ root: TreeNode?) -> (Int, TreeNode?) {
    if root == nil { return (0, root)}
    let l = deep(root?.left) ,r = deep(root?.right)
    let d1 = l.0 , d2 = r.0
    return (max(d1, d2)+1, d1==d2 ? root : d1>d2 ? l.1 : r.1)
  }
}
