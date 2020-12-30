/*
 Question - Game of Life
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/573/week-5-december-29th-december-31st/3586/
 */

class Solution {
  func gameOfLife(_ board: inout [[Int]]) {
    guard board.count > 0 && board[0].count > 0 else {
      return
    }
    func getNextState(_ row:Int, _ col:Int) -> Int {
      var life = 0
      for i in -1...1 {
        for j in -1...1 {
          if i == 0 && j == 0 {
            continue
          }
          let row2 = row + i, col2 = col + j
          guard 0 <= row2 && row2 < board.count
            && 0 <= col2 && col2 < board[0].count else {
              continue
          }
          if (board[row2][col2] & 1) == 1 {
            life += 1
          }
        }
      }
      if life == 3 && (board[row][col] & 1 == 0) {
        return 1
      } else if life == 2 || life == 3 {
        return ((board[row][col] & 1) == 1) ? 1 : 0
      }
      return 0
    }
    for i in 0..<board.count {
      for j in 0..<board[0].count {
        board[i][j] |= (getNextState(i, j) << 1)
      }
    }
    for i in 0..<board.count {
      for j in 0..<board[0].count {
        board[i][j] >>= 1
      }
    }
  }
}
