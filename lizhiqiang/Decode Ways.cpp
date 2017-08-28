class Solution {
public:
    int numDecodings(string s) {
        if (s.length() == 0 || s == "0") {
            return 0;
        }
        return fun(s);
    }
    
private:
    unordered_map<string, int> memMap;
    
    int fun(string str) {
        int n = str.length();
        if (memMap.find(str) != memMap.end()) {
            return memMap[str];
        }
        if (str == "0") {
            memMap[str] = 0;
            return 0;
        }
        if (n == 1 || n == 0) {
            memMap[str] = 1;
            return 1;
        }
        string temp = str.substr(n - 2, 2);
        stringstream ss;
        ss<<temp;
        int tempInt;
        ss>>tempInt;
        if (tempInt == 10 || tempInt == 20) {
            int tem = fun(str.substr(0, n - 2));
            memMap[str] = tem;
            return tem;
        } else if (tempInt % 10 == 0) {
            memMap[str] = 0;
            return 0;
        } else {
            if (tempInt > 26) {
                int tem = fun(str.substr(0, n - 1));
                memMap[str] = tem;
                return tem;
            } else {
                int tem = fun(str.substr(0, n - 1)) + (temp[0] == '0' ? 0 : fun(str.substr(0, n - 2)));
                memMap[str] = tem;
                return tem;
            }
        }
    }
};
