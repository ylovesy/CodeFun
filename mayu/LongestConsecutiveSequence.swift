import Foundation

/*
 Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 
 For example,
 Given [100, 4, 200, 1, 3, 2],
 The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
 
 Your algorithm should run in O(n) complexity.
 */

private class Solution {// 测试case为[2147483646,0,2,2147483644,2147483645]，由于数太大，耗时
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return 1
        }
        let max = nums.max()
        let min = nums.min()
        if max == min {
            return 1
        }
        let length = max! - min! + 1
        var ary = [UInt](repeatElement(0, count: length))
        for val in nums {
            ary[val - min!] = 1
        }
        return count(ary)
    }
    func count(_ nums: [UInt]) -> Int {
        var count = 0
        var max = 0
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                count += 1
            } else {
                count = 0
            }
            max = max > count ? max : count
        }
        return max
    }
}
private class Solution1 { //hash
    func longestConsecutive(_ nums: [Int]) -> Int {
        var dic: [Int:Int] = [:]
        var max = 0
        for val in nums {
            if dic[val] == nil {
                let pre = dic[val - 1] ?? 0
                let next = dic[val + 1] ?? 0
                dic[val] = pre + next + 1
                print(dic[val]!)
                max = max > dic[val]! ? max : dic[val]!
                dic[val - pre] = dic[val]
                dic[val + next] = dic[val]
            }
        }
        return max
    }
}
