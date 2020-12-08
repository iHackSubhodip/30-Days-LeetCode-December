/*
 Question - Missing Range
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3558/
 */

class Solution {
  func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
    var result = [String]()
    var nums = [lower - 1] + nums + [upper + 1]
    
    for i in 0...nums.count - 2 {
      if nums[i+1] - nums[i] == 2 {
        result.append("\(nums[i] + 1)")
      } else if nums[i+1] - nums[i] > 2 {
        result.append("\(nums[i] + 1)->\(nums[i+1] - 1)")
      }
    }
    
    return result
  }
}
