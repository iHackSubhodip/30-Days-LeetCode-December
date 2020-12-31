/*
 Question - Largest Rectangle in Histogram
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3587/
 */

class Solution {
  func largestRectangleArea(_ heights: [Int]) -> Int {
    
    var heights = heights
    heights.append(0)
    var stack:[Int] = []
    var maxArea = 0
    
    for i in 0..<heights.count {
      while !stack.isEmpty && heights[i] <= heights[stack.last!] {
        let height = heights[stack.removeLast()]
        var width = i
        if !stack.isEmpty {
          width = i-stack.last!-1
        }
        maxArea = max(maxArea, width*height)
      }
      stack.append(i)
    }
    
    return maxArea
  }
}
