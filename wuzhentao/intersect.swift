class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map :[Int:Int] = [:]
        var result:[Int] = []
        for i in nums1 {
            if let count = map[i] {
                 map[i] = count + 1
            } else {
                 map[i] = 1
            }
        }
        
        for i in nums2 {
            if let count = map[i]{
                if count > 0 {
                    result.append(i)
                    map[i] = count - 1
                }
                
            }
        }
        
        return result
        
    }
}


let s = Solution()
s.intersect([1], [1,1])
