import Foundation

/*
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
 
 Each letter in the magazine string can only be used once in your ransom note.
 
 Note:
 You may assume that both strings contain only lowercase letters.
 
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 */
private class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazine1 = magazine
        var str = ransomNote
        for ch in ransomNote.characters {
            if magazine1.contains("\(ch)") {
                magazine1.remove(at: (magazine1.range(of: "\(ch)")?.lowerBound)!)
                str.remove(at: (str.range(of: "\(ch)")?.lowerBound)!)
            }
        }
        if str == "" {
            return true
        } else {
            return false
        }
    }
}
