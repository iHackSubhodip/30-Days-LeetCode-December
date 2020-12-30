/*
 Question - Longest Substring with At Most K Distinct Characters
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3584/
 */

class Solution {
  func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
    guard k > 0 else { return 0 }
    let s = Array(s)
    var start = 0, longest = 0, charsFreq = [Character: Int]()
    for (i,char) in s.enumerated(){
      if let freq = charsFreq[char]{
        charsFreq[char] = freq + 1
      }else{
        while charsFreq.count == k{
          longest = max(i-start, longest)
          guard let freq = charsFreq[s[start]] else { fatalError() }
          charsFreq[s[start]] = freq == 1 ? nil : freq - 1
          start += 1
        }
        charsFreq[char] = 1
      }
    }
    return max(longest, s.count - start)
  }
}
