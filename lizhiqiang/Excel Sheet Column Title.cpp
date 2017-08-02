class Solution {
public:
    string convertToTitle(int n) {
        string result;;
        while (n > 0) {
            int posNum = (n - 1) % 26;
            char pos = 'A' + posNum;
            result.push_back(pos);
            n = (n - 1) / 26;
        }
        reverse(result.begin(), result.end());
        return result;
    }
};
