class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a1 = Array(a.utf8CString.dropLast().reversed()).map( { Int($0 - Int8(48)) })
        let len_a = a1.count
        let b1 = Array(b.utf8CString.dropLast().reversed()).map( { Int($0 - Int8(48)) })
        let len_b = b1.count
        var cal: [Int] = []
        var carry = 0
        let count = max(len_b, len_a)
        
        for i in 0..<count {
            if i < len_a {
                carry += a1[i]
            }
            
            if i < len_b {
                carry += b1[i]
            }
            cal.append(carry % 2)
            carry /= 2
        }
        
        if carry != 0 {
            cal.append(1)
        }
        
        var result:String=""
        cal.reversed().forEach { (s) in
            result.append(String(s))
        }
        return result
    }
}
