/*
 Question - Can Place Flowers
 Link - > https://leetcode.com/explore/featured/card/december-leetcoding-challenge/569/week-1-december-1st-december-7th/3555/
 */

class Solution {
  func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var i = 0, count = 0, flowerbed = flowerbed
    while i < flowerbed.count{
      if (flowerbed[i] == 0 && (i == 0 || flowerbed[i-1] == 0) && (i == flowerbed.count - 1 || flowerbed[i+1] == 0)){
        flowerbed[i] = 1
        i += 1
        count += 1
      }
      if count >= n { return true }
      i += 1
    }
    return false
  }
}
