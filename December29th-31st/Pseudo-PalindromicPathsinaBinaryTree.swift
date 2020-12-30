/*
 Question - Pseudo-Palindromic Paths in a Binary Tree
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3585/
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
  func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var path = [Int](repeating: 0, count: 10), result = 0
    func helper(_ node: TreeNode) {
      path[node.val] += 1
      if node.left == nil && node.right == nil {
        if path.reduce(into: Int(0), { if $1 % 2 == 1 { $0 += 1 } }) < 2 { result += 1 }
      } else {
        if let left = node.left { helper(left) }
        if let right = node.right { helper(right) }
      }
      path[node.val] -= 1
    }
    helper(root)
    return result
  }
}
