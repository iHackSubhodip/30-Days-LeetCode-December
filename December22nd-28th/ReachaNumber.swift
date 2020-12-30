/*
 Question - Reach a Number
 Link - > https://leetcode.com/explore/challenge/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3583/
 */

class Solution {
  func reachNumber(_ target: Int) -> Int {
    var k = 0, target = abs(target)
    while target > 0{
      k += 1
      target -= k
    }
    return target % 2 == 0 ? k : k + 1 + k%2
  }
}
