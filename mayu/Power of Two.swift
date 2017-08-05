import Foundation

/*
 231. Power of Two
 Given an integer, write a function to determine if it is a power of two.
 
 Credits:
 Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
 */
private class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && n & (n - 1) == 0
    }
}
