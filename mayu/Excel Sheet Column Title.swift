import Foundation

/*
 168. Excel Sheet Column Title
 Given a positive integer, return its corresponding column title as appear in an Excel sheet.
 
 For example:
 
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 */
private class Solution {
    func convertToTitle(_ n: Int) -> String {
        var res = ""
        var i = n
        while i > 0 {
            i -= 1
            let chStr = String(Character(UnicodeScalar(Int((UnicodeScalar("A")?.value)!) + i % 26)!))
            res = chStr + res
            i /= 26
        }
        return res
    }
}
