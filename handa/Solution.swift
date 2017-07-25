//
//  Solution.swift
//  wendSolution
//
//  Created by Wend on 2017/7/10.
//  Copyright © 2017年 wend. All rights reserved.
//

import UIKit
import Foundation

class Solution: NSObject {
    //MARK: - 1 Aarry hash
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var array = [Int]()
        for i in 0 ..< nums.count-1 {
            let destination = target - nums[i]
            for j in i+1 ..< nums.count {
                if nums[j] == destination {
                    array.append(i)
                    array.append(j)
                }
            }
        }
        return array
    }
    func twoSumImprove(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< nums.count-1 {
            let destination = target - nums[i]
            for j in i+1 ..< nums.count {
                if nums[j] == destination {
                    return [i,j]
                }
            }
        }
        return []
    }
    func twoSumBest(_ nums: [Int], _ target: Int) -> [Int] {
        let count = nums.count
        var m: [Int: Int] = [:]
        for index in (0..<count) {
            let value = nums[index]
            if let idx = m[target - value] {
                return [idx, index]
            }
            m[value] = index
        }
        
        return []
    }
    
    //MARK: - 344. Reverse String
    func reverseString(_ s: String) -> String {
        var result = ""
        for character in s.characters.reversed() {
            result.append(character)
        }
        return result
    }
    func reverseStringImprove(_ s: String) -> String {
        var arr = Array(s.characters)
        let numOfArr = arr.count
        for index in 0 ..< numOfArr/2 {
            let char = arr[index]
            arr[index] = arr[numOfArr - 1 - index]
            arr[numOfArr - 1 - index] = char
        }
        return String(arr)
    }
    func reverseStringBest(_ s: String) -> String {
        let arr = Array(s.characters)
        var result: String = ""
        for i in 0 ..< arr.count {
            result.append(arr[arr.count - 1 - i])
        }
        return result
    }
    
    //MARK: - 461. Hamming Distance
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var diffent = x ^ y
        var count = 0
        while diffent > 0 {
            if diffent % 2 == 1 {
                count = count + 1
            }
            diffent /= 2
        }
        return count
    }
    func hammingDistanceBest(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var count = 0
        repeat {
            if (z >> 1) << 1 != z {
                count += 1
                z = z >> 1
            } else {
                z = z >> 1
            }} while z != 0
        return count
    }
    //MARK: - 617. Merge Two Binary Trees
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if  t1 != nil && t2 != nil {
            t1?.val += (t2?.val)!
        } else if t1 != nil && t2 == nil {
            return t1
        } else if t1 == nil && t2 != nil {
            return t2
        }
        t1?.left = self.mergeTrees(t1?.left, t2?.left)
        t1?.right = self.mergeTrees(t1?.right, t2?.right)
        return t1
    }
    func mergeTreesImprove(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        } else if t2 == nil {
            return t1
        } else if t1 != nil && t2 != nil {
            t1?.val += (t2?.val)!
        }
        t1?.left = self.mergeTrees(t1?.left, t2?.left)
        t1?.right = self.mergeTrees(t1?.right, t2?.right)
        return t1
    }
    
    //MARK: - 26. Remove Duplicates from Sorted Array
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var count = 0
        for num in nums {
            if nums[count] != num {
                nums[count] = num;
                count += 1
            } else {
                
            }
        }
        return count + 1
    }
    func removeDuplicatesImprove(_ nums: inout [Int]) -> Int {
        let total = nums.count
        if total < 2 {
            return total;
        }
        
        var count = 0
        for index in 0 ..< total {
            if nums[count] != nums[index] {
                count += 1
                nums[count] = nums[index];
            }
        }
        return count + 1
    }
    
    //MARK: - 283. Move Zeroes
    func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count;
        var zeroIndex = 0;
        for i in 0 ..< count {
            if nums[i] != 0 {
                while nums[zeroIndex] != 0 && zeroIndex < i {
                    zeroIndex += 1
                }
                let tmp = nums[i]
                nums[i] = nums[zeroIndex]
                nums[zeroIndex] = tmp
            }
        }
    }
    func moveZeroesImprove(_ nums: inout [Int]) {
        var begin = 0
        var end = 0
        while end < nums.count {
            if nums[end] != 0 {
                let temp = nums[end]
                nums[end] = nums[begin]
                nums[begin] = temp
                begin += 1
            }
            end += 1
        }
    }
    
    //MARK: - 128. Longest Consecutive Sequence
    func longestConsecutive(_ nums: [Int]) -> Int {
        let count = nums.count
        var best = 0
        var existDict:[Int:Int] = [:]
        var visitDict:[Int:Int] = [:]
        for num in nums {
            existDict[num] = 1
        }
        for num in nums {
            if visitDict[num] == 1 {
                continue
            }
            visitDict[num] = 1
            var length = 0
            for index in 0 ..< count {
                if existDict[num - index] == 1 {
                    visitDict[num - index] = 1
                    length += 1
                } else {
                    break;
                }
            }
            best = max(best, length)
        }
        return best
    }
    func longestConsecutiveBest(_ nums: [Int]) -> Int {
        let hash = Set(nums)
        var longestSeqLength = 0
        for n in nums {
            if !hash.contains(n - 1) { // First element in sequence
                var currentSeqLength = 1
                var m = n + 1
                while hash.contains(m) { // Check if consecutive numbersa are in hash
                    currentSeqLength += 1
                    m += 1
                }
                if currentSeqLength > longestSeqLength {
                    longestSeqLength = currentSeqLength
                }
            }
        }
        
        return longestSeqLength
    }
    
    //MARK: - 27. Remove Element
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for j in 0 ..< nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
    func removeElementBest(_ nums: inout [Int], _ val: Int) -> Int {
        var count = 0
        var i = 0
        while (i < nums.count) {
            if (nums[i] == val) {
                count += 1
            }
            else {
                nums[i - count] = nums[i]
            }
            i += 1
        }
        return nums.count - count
    }
    
    //MARK: - 3Sum
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count < 3 {
            return []
        }
        var result:[[Int]] = [];
        for i in 0 ..< count - 2 {
            for j in i+1 ..< count - 1 {
                for k in j+1 ..< count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        var have = false
                        for var tmp in result {
                            if tmp.contains(nums[i]) {
                                tmp.remove(at: tmp.index(of: nums[i])!)
                                if tmp.contains(nums[j]) {
                                    have = true
                                }
                            }
                        }
                        if have == false {
                            result.append([nums[i],nums[j],nums[k]])
                        }
                        
                    }
                }
            }
        }
        return result;
    }
    func threeSumImprove(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count < 3 {
            return []
        }
        let sortedNums = nums.sorted()
        var result:[[Int]] = [];
        var dict1:[Int:Int] = [:]
        for i in 0 ..< count - 2 {
            if dict1[sortedNums[i]] == 1 {
                continue
            }
            var dict2:[Int:Int] = [:]
            for j in i+1 ..< count - 1 {
                for k in j+1 ..< count {
                    if dict2[sortedNums[k]] == 1 || dict2[sortedNums[j]] == 1{
                        continue
                    }
                    if sortedNums[i] + sortedNums[j] + sortedNums[k] == 0 {
                        result.append([sortedNums[i],sortedNums[j],sortedNums[k]])
                        dict2[sortedNums[k]] = 1
                        dict2[sortedNums[j]] = 1
                    }
                }
            }
            dict1[sortedNums[i]] = 1
        }
        return result;
    }
    
    //MARK: - 628 Maximum Product of Three Numbers
    func maximumProduct(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 3{
            return 0
        }
        let sortedNums = Array(nums.sorted().reversed())
        if sortedNums[count-1] > 0 || sortedNums[0] < 0 {
            return sortedNums[0] * sortedNums[1] * sortedNums[2]
        } else if (sortedNums[count-1] < 0 && sortedNums[count - 2] < 0) {
            let num1 = sortedNums[0] * sortedNums[1] * sortedNums[2]
            let num2 = sortedNums[0] * sortedNums[count-1] * sortedNums[count - 2]
            return num1 > num2 ? num1 : num2
        }
        return 0
    }
    func maximumProductImprove(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 3{
            return 0
        }
        let sortedNums = nums.sorted()
        let num1 = sortedNums[0] * sortedNums[1] * sortedNums[count - 1]
        let num2 = sortedNums[count - 3] * sortedNums[count-1] * sortedNums[count - 2]
        return num1 > num2 ? num1 : num2
    }
    func maximumProductBest(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 3{
            return 0
        }
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for n in nums {
            
            if n > max1 {
                max3 = max2
                max2 = max1
                max1 = n
            } else if n > max2 {
                max3 = max2
                max2 = n
            } else if n > max3 {
                max3 = n
            }
            
            if n < min1 {
                min2 = min1
                min1 = n
            } else if n < min2 {
                min2 = n
            }
        }
        return max(max1*max2*max3, max1*min1*min2);
    }
    
}
