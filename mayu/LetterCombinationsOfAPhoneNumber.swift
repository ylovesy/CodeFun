import Foundation

/*
 17. Letter Combinations of a Phone Number
 Given a digit string, return all possible letter combinations that the number could represent.
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

private class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var str = digits.replacingOccurrences(of: "0", with: "")
        str = str.replacingOccurrences(of: "1", with: "")
        let dic = ["2" : ["a", "b", "c"],
                   "3" : ["d", "e", "f"],
                   "4" : ["g", "h", "i"],
                   "5" : ["j", "k", "l"],
                   "6" : ["m", "n", "o"],
                   "7" : ["p", "q", "r", "s"],
                   "8" : ["t", "u", "v"],
                   "9" : ["w", "x", "y", "z"],]
        var resAry = [String]()
        for ch in str.characters {
            if dic["\(ch)"] == nil {
                continue
            }
            let tempAry = dic["\(ch)"]!
            if resAry.isEmpty {
                for str in tempAry {
                    resAry.append(str)
                }
            } else {
                var newAry = [String]()
                for resStr in resAry {
                    for str in tempAry {
                        newAry.append(resStr + str)
                    }
                }
                resAry = newAry
            }
        }
        return resAry
    }
}
