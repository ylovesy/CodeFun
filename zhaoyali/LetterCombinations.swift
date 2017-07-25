//
//  LetterCombinations.swift
//  algorithm
//
//  Created by bailee on 2017/7/25.
//  Copyright © 2017年 bailee. All rights reserved.
//

import UIKit

class LetterCombinations {
    func letterCombinations(_ digits: String) -> [String] {
        var letterDic:[String:String] = ["2":"abc","3":"def","4":"ghi","5":"jkl","6":"mno","7":"pqrs","8":"tuv","9":"wxyz"]
        
        var res:[String] = []
        
        for character in digits.characters {
            let letters = letterDic[String(character)];
            if !res.isEmpty {
                let oldSize = res.count;
                for index in 0 ..< oldSize {
                    for chara in (letters?.characters)! {
                        res.append(res[index].appending(String(chara)))
                    }
                }
                for _ in 0 ..< oldSize {
                    res.remove(at: 0);
                }
                
            } else {
                for chara in (letters?.characters)! {
                    res.append(String(chara))
                }
            }
        }
        return res;
    }
    

}
