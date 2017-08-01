import Foundation
//
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorts = nums.sorted()
        var sets = [[Int]]()
        if nums.count < 3 {return sets}
        for (i,v) in  sorts.enumerated() {
            if (i>0 && (v == sorts[i-1])) {
                continue
            }
            let sum = 0 - v
            var index = i + 1
            var end = sorts.count - 1
            
            while index < end {
                if sorts[index] + sorts[end] == sum {
                    let result = [v,sorts[index],sorts[end]]
                    sets.append(result)
                    while (index < end && v == sorts[index + 1])  {index += 1}
                    while (index < end && sorts[end] == sorts[end - 1]) {end -= 1}
                    index += 1
                    end -= 1
                    
                } else if sorts[index] + sorts[end] < sum {
                    index += 1
                } else {
                    end -= 1;
                }
            }
            
        }
        
        return sets
    }
}



let arry = [-1,0,1,2,1,-1,-4]
let s = Solution()
print(s.threeSum(arry))
