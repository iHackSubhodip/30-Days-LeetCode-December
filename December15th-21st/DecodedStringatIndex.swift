/*
 Question - Decoded String at Index
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3572/
 */

class Solution {
  func decodeAtIndex(_ S: String, _ K: Int) -> String {
    var size = 0
    let charArray = Array(S)
    for i in S.indices {
      if let intValue = Int(String(S[i])) {
        size *= intValue
      } else {
        size += 1
      }
    }
    guard K <= size else { return "" }
    var K = K
    for i in stride(from: (S.count - 1), through: 0, by: -1) {
      K = K % size
      if K == 0, charArray[i].isLetter {
        return String(charArray[i])
      }
      if let intValue = Int(String(charArray[i]))  {
        size /= intValue
      } else {
        size -= 1
      }
    }
    return ""
  }
}
