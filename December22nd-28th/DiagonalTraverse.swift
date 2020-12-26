/*
 Question - Diagonal Traverse
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3580/
 */

class Solution {
  func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
    var result: [Int] = []
    
    guard matrix.count != 0 else{ return [] }
    var rowCount = matrix.count, columnCount = matrix[0].count, rowIndex = 0, columnIndex = 0
    while result.count != rowCount * columnCount{
      result.append(matrix[rowIndex][columnIndex])
      if (rowIndex + columnIndex) % 2 == 0{
        rowIndex = (columnIndex == columnCount - 1) ? rowIndex + 1 : max(0, rowIndex - 1)
        columnIndex = min(columnCount - 1, columnIndex + 1)
      }else{
        columnIndex = (rowIndex == rowCount - 1) ? columnIndex + 1 : max(0, columnIndex - 1)
        rowIndex = min(rowCount - 1, rowIndex + 1)
      }
    }
    return result
  }
}
