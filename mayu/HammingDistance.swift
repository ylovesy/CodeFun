import Foundation
class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        let str = String(x ^ y,radix:2)
        var count =  0
        for ch in str.characters {
            count += Int("\(ch)")!
        }
        return count
    }
}
