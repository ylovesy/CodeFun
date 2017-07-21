import Foundation

/*
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */
private class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        let ary = nums.sorted()
        var res = [[Int]]()
        for i in 0 ..< nums.count - 2 {
            if i == 0 || (i > 0 && ary[i] != ary[i - 1]) {
                var leftIdx = i + 1
                var rightIdx = nums.count - 1
                let sum = 0 - ary[i]
                while leftIdx < rightIdx {
                    if ary[leftIdx] + ary[rightIdx] == sum {
                        res.append([ary[i], ary[leftIdx], ary[rightIdx]])
                        while leftIdx < rightIdx && ary[leftIdx] == ary[leftIdx + 1] {
                            leftIdx += 1
                        }
                        while leftIdx < rightIdx && ary[rightIdx] == ary[rightIdx - 1] {
                            rightIdx -= 1
                        }
                        rightIdx -= 1
                        leftIdx += 1
                    } else if ary[leftIdx] + ary[rightIdx] > sum {
                        rightIdx -= 1
                    } else {
                        leftIdx += 1
                    }
                }
            }
        }
        return res
    }
}
