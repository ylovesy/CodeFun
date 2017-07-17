import Foundation

/*
 Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
 Do not allocate extra space for another array, you must do this in place with constant memory.
 For example,
 Given input array nums = [1,1,2],
 Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.
 */
private class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return  0
        }
        var curIndex = 0
        for val in nums {
            if nums[curIndex] < val {
                curIndex += 1
                nums[curIndex] = val
            }
        }
        return curIndex + 1
    }
}
