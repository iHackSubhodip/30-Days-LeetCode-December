/*
 Question - Shortest Word Distance
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3550/
 */

class Solution {
  func shortestDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
    var word1Index = -1, word2Index = -1, shortestDistance = Int.max
    for (key, val) in words.enumerated(){
      if val == word1 { word1Index = key }
      if val == word2 { word2Index = key }
      if word1Index != -1 && word2Index != -1{
        shortestDistance = min(shortestDistance, abs(word2Index - word1Index))
      }
    }
    return shortestDistance
  }
}
