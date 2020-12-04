/*
 Question - The kth Factor of n
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3554/
 */

class Solution {
  func kthFactor(_ n: Int, _ k: Int) -> Int {
    var arr : [Int] = []
    for i in 1...n{
      if n % i == 0{
        arr.append(i)
      }
      if arr.count == k{
        return arr[k-1]
      }
    }
    return -1
  }
}
