import Foundation

/*
 A message containing letters from A-Z is being encoded to numbers using the following mapping:
 
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given an encoded message containing digits, determine the total number of ways to decode it.
 
 For example,
 Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).
 
 The number of ways decoding "12" is 2.
 */
private class Solution {
    func numDecodings(_ s: String) -> Int {
        if s.characters.count == 0 {
            return 0
        }
        var dp = [Int](repeating: 0, count: s.characters.count + 1)
        dp[s.characters.count] = 1
        var chAry = [Character]()
        for ch in s.characters {
            chAry.append(ch)
        }
        dp[s.characters.count - 1] = chAry[chAry.count - 1] != "0" ? 1 : 0
        for i in (0 ..< s.characters.count - 1).reversed() {
            if chAry[i] != "0" {
                let str = "\(chAry[i])" + "\(chAry[i + 1])"
                dp[i] = Int(str)! <= 26 ? dp[i + 1] + dp[i + 2] : dp[i + 1]
            } else {
                continue
            }
        }
        return dp[0]    }
}
