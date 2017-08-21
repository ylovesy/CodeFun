class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var j = Int.min
        
        nums.forEach { (value) in
            sum += value
            j = max(j, sum)
            
            if sum < 0 {
                sum = 0
            }
        }
        
        return j
        
    }
}


let s = Solution()
s.maxSubArray([-1])
