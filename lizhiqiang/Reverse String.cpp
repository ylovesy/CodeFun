class Solution {
public:
    string reverseString(string s) {
        string result = s;
        long length = result.length();
        for (int i = 0; i < length / 2; i++) {
            char temp = result[i];
            result[i] = result[length - i - 1];
            result[length - i - 1] = temp;
        }
        return result;
    }
};
