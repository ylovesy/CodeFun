class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var sets = Set<Int>(nums)
        
        var length = 0
    
        for (i,num) in nums.enumerated() {
            var left:Int = nums[i] - 1
            
            while sets.contains(left) {
                sets.remove(left)
                left -= 1
            }
    
            var right:Int = nums[i] + 1
            while sets.contains(right) {
                sets.remove(right)
                right += 1
            }
            
            length = max(length, right - left - 1) 
        }
        return length
    }
}
