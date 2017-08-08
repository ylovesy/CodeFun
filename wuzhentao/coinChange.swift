class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: -1, count: amount + 1)
        
        dp[0] = 0
        for (index,_) in dp.enumerated() {
            if dp[index] < 0 {
                continue
            }
            for item2 in coins {
                let amc = index + item2
                if amc > amount {
                    continue
                }
                
                if dp[amc] > dp[index] + 1 || dp[amc] < 0 {
                    dp[amc] = dp[index] + 1
                }
                
            }
        }
        
        let result = dp[amount];
        return result
        
        
    }
}

