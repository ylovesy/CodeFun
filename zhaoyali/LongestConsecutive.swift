//
//  LongestConsecutive.swift
//  algorithm
//
//  Created by bailee on 2017/7/20.
//  Copyright © 2017年 bailee. All rights reserved.
//

import UIKit

class LongestConsecutive {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var hashDic: [Int:Int] = [:]
        var res = 0
        for val in nums {
            if hashDic[val] == nil {
                let pre = hashDic[val - 1] ?? 0
                let next = hashDic[val + 1] ?? 0
                let sum = pre + next + 1
                hashDic[val] = sum
                res = res > sum ? res : sum
                hashDic[val - pre] = sum
                hashDic[val + next] = sum
            }
        }
        return res
    }
}
