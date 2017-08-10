class Solution {
public:
    bool canConstruct(string ransomNote, string magazine) {
        int *magList[128] = {0};
        for (int i = 0; i < magazine.size(); i++) {
            int charInt = magazine[i];
            magList[charInt]++;
        }
        for (int i = 0; i < ransomNote.size(); i++) {
            int charInt = ransomNote[i];
            if(magList[charInt] <= 0) {
                return false;
            } else {
                magList[charInt]--;
            }
        }
        return true;
    }
};

//以下做法很傻
class Solution {
public:
    bool canConstruct(string ransomNote, string magazine) {
        sort(ransomNote.begin(), ransomNote.end());
        sort(magazine.begin(),magazine.end());
        int j = 0;
        for (int i = 0; i < ransomNote.size(); ) {
            for (; j < magazine.size(); j++) {
                if (ransomNote[i] == magazine[j]) {
                    j++;
                    i++;
                    break;
                }
            }
            if (j == magazine.size() && i < ransomNote.size()) {
                return false;
            }
        }
        return true;
    }
};
