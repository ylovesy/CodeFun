import Foundation

/*
 Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 Note: The solution set must not contain duplicate quadruplets.
 For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
 A solution set is:
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
 */
private class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var ary = [[Int]]()
        if nums.count >= 4 {
            for i in 0 ..< nums.count - 3 {
                let a = nums[i]
                for i1 in i + 1 ..< nums.count - 2 {
                    let b = nums[i1]
                    for i2 in i1 + 1 ..< nums.count - 1 {
                        let c = nums[i2]
                        for i3 in i2 + 1 ..< nums.count {
                            let d = nums[i3]
                            if a + b + c + d == target {
                                ary.append([a, b, c, d])
                            }
                        }
                    }
                }
            }
        }
        ary = ary.map{$0.sorted()}
        var resAry = [[Int]]()
        for val in ary {
            if !resAry.contains(where: { $0 == val}) {
                resAry.append(val)
            }
        }
        return resAry
    }
}
