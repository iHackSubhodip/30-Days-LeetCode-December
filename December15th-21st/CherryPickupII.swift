/*
 Question - Cherry Pickup II
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3571/
 */

class Solution {
  func cherryPickup(_ grid: [[Int]]) -> Int {
    var visited = [[[Int]]](repeating:
      [[Int]](repeating:
        [Int](repeating: -1,
              count: grid.first!.count
        ),
              count: grid.first!.count
      ),
                            count: grid.count
    )
    return solve(0, 0, grid.first!.count - 1, grid, &visited)
  }
  
  func solve(_ i: Int, _ r1j: Int, _ r2j: Int, _ grid: [[Int]], _ visited: inout [[[Int]]]) -> Int {
    if i == grid.count - 1 {
      return r1j == r2j ? grid[i][r1j] : grid[i][r1j] + grid[i][r2j]
    }
    
    if visited[i][r1j][r2j] >= 0 {
      return visited[i][r1j][r2j]
    }
    
    let cols = grid.first!.count
    let moves = [-1, 0, 1]
    
    var m = 0
    for r1m in moves {
      for r2m in moves {
        let nr1j = r1j + r1m
        let nr2j = r2j + r2m
        
        if (0 <= nr1j && nr1j < cols) && (0 <= nr2j && nr2j < cols) {
          m = max(m, solve(i + 1, nr1j, nr2j, grid, &visited))
        }
      }
    }
    
    visited[i][r1j][r2j] = r1j == r2j ? m + grid[i][r1j] : m + grid[i][r1j] + grid[i][r2j]
    
    return visited[i][r1j][r2j]
  }
}
