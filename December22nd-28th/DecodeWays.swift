/*
 Question - Decode Ways
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3581/
 */

class Solution {
  func numDecodings(_ s: String) -> Int {
    var s = Array(s), dp = Array(repeating: 0,count: s.count+1)
    dp[0] = 1
    for i in 1...s.count{
      if s[i-1] != "0"{
        dp[i] += dp[i-1]
      }
      if i > 1 && isValid(s,i-2,i-1){
        dp[i] += dp[i-2]
      }
    }
    return dp[s.count]
  }
  
  func isValid(_ s: [Character],_ start: Int,_ end: Int) -> Bool{
    guard let num = Int(String(s[start...end])) else{ fatalError() }
    return num >= 10 && num <= 26
  }
}
