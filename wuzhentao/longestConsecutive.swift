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

//Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
//
//For example,
//Given [100, 4, 200, 1, 3, 2],
//The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
//
//Your algorithm should run in O(n) complexity.
//
