/*
 Question - Smallest Range II
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3573/
 */

class Solution {
  func smallestRangeII(_ A: [Int], _ K: Int) -> Int {
    if A.count == 1 {
      return 0
    }
    
    let A = A.sorted()
    let mininum = A.min()!
    let maxinum = A.max()!
    var diff = maxinum - mininum
    
    if maxinum - mininum >= K {
      for index in 0 ..< A.count - 1 {
        diff = min(diff, max(maxinum - K, A[index] + K) - min(mininum + K, A[index + 1] - K))
      }
    }
    return diff
  }
}
