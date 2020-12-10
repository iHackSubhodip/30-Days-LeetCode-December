/*
 Question - Valid Mountain Array
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3561/
 */

class Solution {
  func validMountainArray(_ A: [Int]) -> Bool {
    let count = A.count
    if count < 3 { return false }
    
    var index = 1
    while index < A.count && A[index - 1] < A[index] {
      index += 1
    }
    
    if index == 1 || index == count { return false }
    while index < A.count && A[index - 1] > A[index] {
      index += 1
    }
    
    return index == count
  }
}
