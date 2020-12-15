/*
 Question - Squares of a Sorted Array
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3567/
 */

class Solution {
  func sortedSquares(_ A: [Int]) -> [Int] {
    var left: Int = 0, right: Int = A.count - 1, resultArray = Array(repeating: 0, count: A.count)
    
    for i in (0..<A.count).reversed(){
      if abs(A[left]) > abs(A[right]){
        resultArray[i] = A[left] * A[left]
        left += 1
      }else{
        resultArray[i] = A[right] * A[right]
        right -= 1
      }
    }
    return resultArray
  }
}
