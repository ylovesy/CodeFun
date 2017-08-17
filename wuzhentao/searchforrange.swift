class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res : [Int] = []
        var start = 0
        var end = nums.count - 1
        var mid = 0;
        
        while start <= end {
            mid = (start + end) / 2
            
            if nums[mid] == target {
                var low = mid
                var high = mid
                
                while low >= 0 && nums[low] == target {
                    low -= 1
                }
                
                while high <= nums.count - 1 && nums[high] == target {
                    high += 1
                }
                res.append(low + 1)
                res.append(high - 1)
                return res
                
            } else if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        return [-1,-1]
    }
}

let s = Solution()
print(s.searchRange([5, 7, 7, 8, 8, 10], 8))
