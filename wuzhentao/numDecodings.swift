class Solution {
    func numDecodings(_ s: String) -> Int {
        // 120 dp[i] = dp[i - 2]
        // dp[i] = dp[i - 1] + dp[i - 2] when 1 <= s[i-1,i] <= 26
        // dp[i] = dp[i - 1] when s[i-1, i] > 26
        // 12
        //
        let arr = Array(s.utf8).map { Int($0) - 48 }
        if arr.isEmpty {
            return 0
        }
        var dp = [Int](repeating: 0, count: arr.count + 1)
        dp[0] = 1
        dp[1] = arr[0] == 0 ? 0 : 1
        if arr.count < 2 {
            return dp[arr.count]
        }
        for i in 2...arr.count {
            let index = i - 1
            let num = arr[index - 1] * 10 + arr[index]
            if arr[index] > 0 && arr[index] < 10 {
                dp[i] += dp[i - 1]
            }
            if num <= 26 && num >= 10 {
                dp[i] += dp[i - 2]
            }
        }
        return dp[arr.count]
    }
}


let c = Solution()
print (c.numDecodings("2"))
