//
//  main.swift
//  dddd
//
//  Created by 武镇涛 on 2017/7/26.
//  Copyright © 2017年 wuzhentao. All rights reserved.
//

//: Playground - noun: a place where people can play

import Foundation

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let nums:[String] = ["","","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"]
        var list:[String] = []
        var uncodes:[Int] = []
        for codeUnit in digits.utf16 {
            uncodes.append(Int(codeUnit))
        }
        self.letterCombination(list: &list, digits: uncodes, curr: "", index: 0, nums: nums)
        return list
    }
    
    func letterCombination( list:inout [String],digits:[Int],curr:String,index:Int,nums:[String]) {
        if index == digits.count {
            if curr.characters.count != 0 {
                list.append(curr)
            }
            return
        }
        
        
        let num:String = nums[digits[index] - Int("0".utf16.first!)]
        for char in num.characters {
            let next:String = curr + String(char)
            self.letterCombination(list: &list, digits: digits, curr: next, index: index + 1, nums: nums)
        }
        
    }
}

let nus = "23"
let s = Solution()


print(s.letterCombinations(nus))

