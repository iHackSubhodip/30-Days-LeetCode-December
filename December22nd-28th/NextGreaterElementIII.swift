/*
 Question - Next Greater Element III
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3578/
 */

class Solution {
  func nextGreaterElement(_ n: Int) -> Int {
    var characters = Array(n.description)
    
    var i = characters.count - 2
    var j = characters.count - 1
    
    while i >= 0 && characters[i + 1] <= characters[i] {
      i -= 1
    }
    
    if i < 0 { return -1 }
    
    while j >= 0 && characters[j] <= characters[i] {
      j -= 1
    }
    
    characters.swapAt(i, j)
    characters.reverse(from: i + 1)
    
    if let result = Int(String(characters)), result < Int32.max {
      return result
    }
    
    return -1
  }
}

extension Array {
  mutating func reverse(from: Int) {
    var i = from
    var j = count - 1
    while i < j {
      swapAt(i, j)
      i += 1
      j -= 1
    }
  }
}
