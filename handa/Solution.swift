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
}
