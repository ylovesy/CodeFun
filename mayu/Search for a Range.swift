import Foundation

/*
 34. Search for a Range
 Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 For example,
 Given [5, 7, 7, 8, 8, 10] and target value 8,
 return [3, 4].
 */
private class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        var idx = -1
        
        if nums.contains(target) {
            idx = nums.index(of: target)!
        } else {
            return [-1,-1]
        }
        var ary = [idx]
        for i in idx + 1 ..< nums.count {
            if nums[i] == target {
                ary.append(i)
            } else {
                break
            }
        }
        let res = [ary.first,ary.last]
        return res as! [Int]
    }
}
