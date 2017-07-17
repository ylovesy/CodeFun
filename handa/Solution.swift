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
}
