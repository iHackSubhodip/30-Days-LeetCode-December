/*
 Question - Burst Balloons
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3564/
 */

class Solution {
  func maxCoins(_ nums: [Int]) -> Int {
    let n = nums.count + 2
    var dp = Array(repeating:Array(repeating:0,count:n),count:n)
    let nums = [1] + nums + [1]
    
    for l in stride(from:n-2,through:0,by:-1) {
      for r in l+2..<n {
        for i in l+1..<r {
          let c = nums[l] * nums[i] * nums[r]
          dp[l][r] = max(dp[l][r],  dp[l][i] + c + dp[i][r])
        }
      }
    }
    return dp[0][n-1]
  }
}
