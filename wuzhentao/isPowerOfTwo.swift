class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && ((n & (n - 1)) == 0 );
    }
}

let s = Solution()
print(s.isPowerOfTwo(4))
