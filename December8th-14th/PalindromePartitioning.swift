/*
 Question - Palindrome Partitioning
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3565/
 */

class Solution {
  func partition(_ s: String) -> [[String]] {
    var result = [[String]]()
    var candidate = [String]()
    
    backtracking(&result, &candidate, Array(s), 0)
    
    return result
  }
  
  private func backtracking(_ result: inout [[String]], _ candidate: inout [String], _ characters: [Character], _ start: Int) {
    if start == characters.count {
      result.append(candidate)
    } else {
      for i in start..<characters.count {
        if isPalindrome(characters, start, i) {
          let character = String(characters[start...i])
          candidate.append(character)
          backtracking(&result, &candidate, characters, i + 1)
          candidate.removeLast()
        }
      }
    }
  }
  
  private func isPalindrome(_ characters: [Character], _ low: Int, _ high: Int) -> Bool {
    var low = low
    var high = high
    
    while low < high {
      if characters[low] != characters[high] {
        return false
      }
      low += 1
      high -= 1
    }
    
    return true
  }
}
