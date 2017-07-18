import Foundation

/*
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

private class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        var curIdx = 0
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                let temp = nums[i]
                nums[i] = nums[curIdx]
                nums[curIdx] = temp
                curIdx += 1
            }
        }
    }
}
