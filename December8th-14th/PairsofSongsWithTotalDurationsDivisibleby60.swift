/*
 Question - Pairs of Songs With Total Durations Divisible by 60
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3559/
 */

class Solution {
  func numPairsDivisibleBy60(_ time: [Int]) -> Int {
    var array = Array(repeating: 0, count: 60)
    for t in time{
      array[t % 60] = array[t % 60] + 1
    }
    var i = 1, j = 59, count = 0
    while i < j{
      count += array[i] * array[j]
      i += 1
      j -= 1
    }
    count += array[i] * (array[i] - 1)/2
    count += array[0] * (array[0] - 1)/2
    return count
  }
}
