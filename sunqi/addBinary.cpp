class Solution {
public:
    string addBinary(string a, string b) {
        string ans;
        int carry = 0;
        int sum = 0;
        int i = a.size() - 1, j = b.size() - 1;
        while (!(i < 0 && j < 0)) {
            int ai = i >= 0 ? a[i] - '0' : 0;
            int bj = j >= 0 ? b[j] - '0' : 0;
            sum = ai + bj + carry;
            ans.insert(ans.begin(), sum % 2 + '0');
            carry = sum / 2;
            --i, --j;
        }
        if (carry == 1) {
            ans.insert(ans.begin(), '1');
        }
        return ans;
    }
};
