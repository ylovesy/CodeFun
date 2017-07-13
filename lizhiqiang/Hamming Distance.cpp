class Solution {
public:
    int hammingDistance(int x, int y) {
        int xorNum = x ^ y;
        int count = 0;
        while (xorNum > 0) {
            xorNum = xorNum & (xorNum - 1);
            count++;
        }
        return count;
    }
};
