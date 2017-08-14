class Solution {
    //正负号标记法
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var tmp = nums;
        var arr: [Int] = []
        for i in 0..<tmp.count {
            let index = abs(tmp[i])  - 1
            if tmp[index] > 0 {
                tmp[index] *= -1
            }
        }
        for i in 0..<tmp.count {
            if tmp[i] > 0 {
                arr.append(i+1)
            }
        }
        return arr;
    }
}
