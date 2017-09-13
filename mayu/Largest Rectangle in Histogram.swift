import Foundation

/*
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
 
 
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
 
 
 The largest rectangle is shown in the shaded area, which has area = 10 unit.
 
 For example,
 Given heights = [2,1,5,6,2,3],
 return 10.
 */
private class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 0 {
            return 0
        }
        return getMax(heights: heights, s: 0, e: heights.count)
    }
    
    func getMax(heights: [Int], s: Int, e: Int) -> Int {
        if s + 1 >= e {
            return heights[s]
        }
        var isIncrease = true
        var min = s
        
        for i in s ..< e {
            if i > s && heights[i - 1] > heights[i] {
                isIncrease = false
            }
            if heights[i] < heights[min] {
                min = i
            }
        }
        if isIncrease {
            var maxSize = 0
            for i in s ..< e {
                maxSize = max(maxSize, heights[i] * (e - i))
            }
            return maxSize
        }
        let leftSize = min > s ? getMax(heights: heights, s: s, e: min) : 0
        let rightSize = min < e - 1 ? getMax(heights: heights, s: min + 1, e: e) : 0
        let maxSize = max(max(leftSize, rightSize), heights[min] * (e - s))
        return maxSize
    }
}
