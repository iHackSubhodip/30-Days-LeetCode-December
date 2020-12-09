/*
 Question - Binary Search Tree Iterator
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3560/
 */

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right=  nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right:TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}


class BSTIterator {
  
  var stack: [TreeNode]
  
  init(_ root: TreeNode?) {
    stack = [TreeNode]()
    allLeftToStack(root)
  }
  
  /** @return the next smallest number */
  func next() -> Int {
    let node = stack.removeLast()
    allLeftToStack(node.right)
    return node.val
  }
  
  /** @return whether we have a next smallest number */
  func hasNext() -> Bool {
    return !stack.isEmpty
  }
  
  func allLeftToStack(_ root: TreeNode?){
    var node = root
    while let current = node{
      stack.append(current)
      node = current.left
    }
  }
}
