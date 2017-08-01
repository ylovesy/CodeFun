class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorts = nums.sorted()
        var result:[[Int]] = []
        
        if nums.count < 3 {
            return result
        }
        for (i,value) in sorts.enumerated() {
            if i > 0 && value == sorts[i - 1] {
                continue
            }
            let sum = target - value
            
            for (j,c) in sorts.enumerated() {
                if j < i + 1 {
                    continue
                }
                if j > i + 1 && c == sorts[j - 1] {
                    continue
                }
                let s = sum - c
                var end = sorts.count - 1
                var begain = j + 1
                
                while begain < end {
                    if s == sorts[begain] + sorts[end] {
                        
                        let r = [value,sorts[begain],sorts[end],c]
                        result.append(r)
                        while (begain < end && c == sorts[begain + 1])  {begain += 1}
                        while (begain < end && sorts[end] == sorts[end - 1]) {end -= 1}
                        
                        end = end - 1
                        begain = begain + 1
                        
                    } else if s < sorts[begain] + sorts[end] {
                        end = end - 1
                    } else {
                        begain = begain + 1
                    }
                }
                
            }
            
            
        }
        return result
    }
}

let s = Solution()
//print(s.fourSum([0, 0, 0, 0], 0))
print(s.fourSum([1, 0, -1, 0, -2, 2], 0))
