import Foundation

/*
 43. Multiply Strings
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.
 
 Note:
 
 The length of both num1 and num2 is < 110.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */
private class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let ary1 = num1.characters.map {(ch) -> Int in
            return Int("\(ch)")!}
        let ary2 = num2.characters.map {(ch) -> Int in
            return Int("\(ch)")!}
        var ary = Array.init(repeating: 0, count: ary1.count + ary2.count)
        for i in (0 ... ary1.count - 1).reversed() {
            for j in (0 ... ary2.count - 1).reversed() {
                let product = ary1[i] * ary2[j]
                let sum = ary[i + j + 1] + product
                ary[i + j + 1] = sum % 10
                ary[i + j] += sum / 10
            }
        }
        while ary.count > 0 && ary[0] == 0 {
            ary.remove(at: 0)
        }
        
        if ary.count > 0 {
            return ary.reduce("") { $0 + "\($1)" }
        } else {
            return "0"
        }
    }
}
