class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        let sorts = nums.sorted()
        let count = nums.count
        let sum1 = sorts[0] * sorts[1] * sorts[count - 1]
        let sum2 = sorts[count - 1] * sorts[count - 2] * sorts[count - 3]
        return max(sum1, sum2)
        
    }
}

