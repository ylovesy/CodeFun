class Solution {
    var nums:[Int]
    var location:Int = -1
    var length:Int = -1
    
    
    
    init(nums:[Int]) {
        self.nums = nums
    }
    
    func sumRange(location:Int,length:Int) -> Int {
        let loct = self.location > 0 ? self.location : location
        let len = self.length  > 0 ? self.length :length
        
        
        let sum =  self.nums[loct...len].reduce(0,+)
        return sum
    }
    
    func update(location:Int,length:Int) {
        self.location = location
        self.length = length
    }
}


let s = Solution(nums: [1,3,5])
print (s.sumRange( location: 0, length: 2))
s.update(location: 1, length: 2)

print (s.sumRange(location: 0, length: 2))
