class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let a = Array(num1.utf8CString.dropLast().reversed()).map( { Int($0 - Int8(48)) })
        let len_a = a.count
        let b = Array(num2.utf8CString.dropLast().reversed()).map( { Int($0 - Int8(48)) })
        let len_b = b.count
        
        var cal: [Int] = Array(repeating: 0, count: len_a + len_b)
        
        for i in 0..<len_a {
            for j in 0..<len_b {
                cal[i + j] += a[i] * b[j]
            }
        }
        
        let pivot = len_a + len_b
        
        var carry = 0
        
        for i in 0..<pivot {
            let sum = carry + cal[i]
            cal[i] = sum % 10
            carry = sum / 10
        }
    
        var count = 0;
        cal = cal.reversed()
        while(count < cal.count - 1 && cal[count] == 0) {count += 1};
        cal.removeFirst(count)
        
        var result:String=""
        cal.forEach { (s) in
            result.append(String(s))
        }

        return result
    }
}
