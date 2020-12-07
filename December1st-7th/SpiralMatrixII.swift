/*
 Question - Spiral Matrix II
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3557/
 */

class Solution {
  func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
    var current = 1
    
    var row1 = 0, row2 = n
    var col1 = 0, col2 = n
    
    while row1 < row2 {
      
      for col in stride(from: col1, to: col2, by: 1) {
        matrix[row1][col] = current
        current += 1
      }
      
      for row in stride(from: row1+1, to: row2, by: 1) {
        matrix[row][col2-1] = current
        current += 1
      }
      
      if row1 < row2-1 && col1 < col2-1 {
        for col in stride(from: col2-2, to: col1-1, by: -1) {
          matrix[row2-1][col] = current
          current += 1
        }
        
        for row in stride(from: row2-2, to: row1, by: -1) {
          matrix[row][col1] = current
          current += 1
        }
      }
      
      row1 += 1
      row2 -= 1
      col1 += 1
      col2 -= 1
    }
    
    return matrix
  }
}
