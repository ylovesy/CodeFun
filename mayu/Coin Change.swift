import Foundation

/*
 322. Coin Change
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 Example 1:
 coins = [1, 2, 5], amount = 11
 return 3 (11 = 5 + 5 + 1)
 
 Example 2:
 coins = [2], amount = 3
 return -1.
 
 Note:
 You may assume that you have an infinite number of each kind of coin.
 
 Credits:
 Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
 */
private class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var dp = Array(repeatElement(-1, count: amount + 1))
        dp[0] = 0
        for curMoney in 0 ..< dp.count {
            if dp[curMoney] == -1 {
                continue
            }
            for money in coins {
                if money + curMoney > amount {
                    continue
                }
                if dp[money + curMoney] == -1 {
                    dp[money + curMoney] = dp[curMoney] + 1
                } else {
                    dp[money + curMoney] = min(dp[money + curMoney], dp[curMoney] + 1)
                }
                
            }
        }
        
        return dp[amount]
    }
}
