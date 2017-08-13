//
//  Word Search.swift
//  MY_swift_leetcode
//
//  Created by mayu on 2017/8/13.
//  Copyright © 2017年 MY. All rights reserved.
//

import Foundation
/*
 79. Word Search
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 For example,
 Given board =
 
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 word = "ABCCED", -> returns true,
 word = "SEE", -> returns true,
 word = "ABCB", -> returns false.
 */
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var ary = board
        for i in 0 ..< ary.count {
            for j in 0 ..< ary[0].count {
                if recu(&ary, word, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    func recu(_ board: inout [[Character]], _ word: String, _ start:Int, _ i:Int, _ j:Int) -> Bool {
        if start ==  word.characters.count {
            return true
        }
        if i < 0 || j < 0 || i >= board.count || j >= board[0].count {
            return false
        }
        let chAry: [CChar] = word.cString(using: String.Encoding.utf8)!
        if "\(chAry[start])" != "\(board[i][j])" {
            return false
        }
        board[i][j] = "*"
        let res = recu(&board,word,start + 1,i - 1,j) ||
            recu(&board,word,start + 1,i + 1,j) ||
            recu(&board,word,start + 1,i,j + 1) ||
            recu(&board,word,start + 1,i,j - 1)
        board[i][j] = Character("\(chAry[start])")
        return res
        
    }
}
