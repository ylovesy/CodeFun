import Foundation

/*
 136. Single Number
 Given an array of integers, every element appears twice except for one. Find that single one.
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */
private class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0;
        for val in nums {
            res ^= val
        }
        return res
    }
}
