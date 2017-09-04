import Foundation

/*
 324. Wiggle Sort II
 Given an unsorted array nums, reorder it such that nums[0] < nums[1] > nums[2] < nums[3]....
 
 Example:
 (1) Given nums = [1, 5, 1, 1, 6, 4], one possible answer is [1, 4, 1, 5, 1, 6].
 (2) Given nums = [1, 3, 2, 2, 3, 1], one possible answer is [2, 3, 1, 3, 1, 2].
 
 Note:
 You may assume all input has valid answer.
 */
private class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        nums.sort()
        var idx = (nums.count + 1) / 2
        let ary = nums
        var idx1 = nums.count
        for i in (0 ..< nums.count){
            if i % 2 == 1 {
                idx1 -= 1
                nums[i] = ary[idx1]
                
            } else {
                idx -= 1
                nums[i] = ary[idx]
                
            }
        }
    }
}
