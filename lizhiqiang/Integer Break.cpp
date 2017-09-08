class Solution {
public:
    int integerBreak(int n) {
        int product = 1;
        int count = 1;
        while (n > 4) {
            if (n > 3) {
                n -= 3;
                product *= 3;
                count++;
            }
        }
        if (count == 1 && n != 4) {
            n = n - 1;
            product *= n;
        }
        if (n == 4) {
            product *= 4;
        } else if (n == 2 && count >= 2) {
            product *= 2;
        } else if (n == 3 && count >= 2) {
            product *= 3;
        }
        return product;
    }
};
