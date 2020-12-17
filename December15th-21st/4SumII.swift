/*
 Question - 4Sum II
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/571/week-3-december-15th-december-21st/3569/
 */

class Solution {
  func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var numsAB = [Int]()
    var numsCD = [Int]()
    var numsABPair = [[Int]]()
    var numsCDPair = [[Int]]()
    var result = 0
    var index = 0
    
    for i in 0..<A.count {
      for j in 0..<B.count {
        numsAB.append(A[i] + B[j])
      }
    }
    for i in 0..<C.count {
      for j in 0..<D.count {
        numsCD.append(C[i] + D[j])
      }
    }
    if numsAB.count == 0 || numsCD.count == 0 {
      return 0
    }
    numsAB = numsAB.sorted()
    numsCD = numsCD.sorted()
    numsABPair = removeDuplicate(numsAB)
    numsCDPair = removeDuplicate(numsCD)
    for i in 0..<numsCDPair.count {
      index = binarySearch(numsABPair, -numsCDPair[i][0])
      if index != -1 {
        result += numsABPair[index][1] * numsCDPair[i][1]
      }
    }
    
    return result
  }
  
  private func removeDuplicate(_ nums: [Int]) -> [[Int]] {
    var num = nums[0]
    var count = 1
    var result = [[Int]]()
    
    for i in 1..<nums.count {
      if nums[i] == num {
        count += 1
      } else {
        result.append([num, count])
        num = nums[i]
        count = 1
      }
    }
    result.append([num, count])
    
    return result
  }
  
  private func binarySearch(_ nums: [[Int]], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    var middle = 0
    var num = 0
    
    while left <= right {
      middle = left + (right - left) / 2
      num = nums[middle][0]
      if num < target {
        left = middle + 1
      } else if num > target {
        right = middle - 1
      } else {
        return middle
      }
    }
    
    return -1
  }
}
