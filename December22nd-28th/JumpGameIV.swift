/*
 Question - Jump Game IV
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/572/week-4-december-22nd-december-28th/3582/
 */

class Solution {
  func minJumps(_ arr: [Int]) -> Int {
    let c = arr.count
    var equals = [Int: [Int]](), unvisited = [Bool](repeating: true, count: c), nextQueue = [Int](), result = 0
    func appendQueue(_ index: Int) {
      if unvisited[index] {
        nextQueue.append(index)
        unvisited[index] = false
      }
    }
    for i in 0..<c {
      equals[arr[i], default: [Int]()].append(i)
    }
    if c > 1 {
      nextQueue.append(0)
      unvisited[0] = false
    }
    while !nextQueue.isEmpty {
      let queue = nextQueue
      nextQueue = []
      result += 1
      for index in queue {
        if index == c - 2 {
          return result
        }
        if index < c - 1 {
          appendQueue(index + 1)
        }
        if index > 0 {
          appendQueue(index - 1)
        }
        for nextIndex in equals[arr[index], default: [Int]()] {
          if nextIndex == c - 1 {
            return result
          }
          appendQueue(nextIndex)
        }
        equals[arr[index]] = nil
      }
    }
    return result
  }
}
