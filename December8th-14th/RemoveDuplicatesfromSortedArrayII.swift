/*
 Question - Remove Duplicates from Sorted Array II
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/570/week-2-december-8th-december-14th/3562/
 */

class Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    var idx = nums.count-1
    
    while idx > 1 {
      if nums[idx] == nums[idx-2] {
        nums.remove(at: idx)
      }
      idx -= 1
    }
    return nums.count
  }
}
