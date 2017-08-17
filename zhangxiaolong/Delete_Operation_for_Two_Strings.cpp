//
//  Delete_Operation_for_Two_Strings.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/17.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
// 583. Delete Operation for Two Strings
//Example 1:
//Input: "saead", "aeatd"
//Output: 2
//Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
//Note:
//The length of given words won't exceed 500.
//Characters in given words can only be lower-case letters.

#include <stdio.h>
#include <string>

using namespace std;

class Delete_Operation_for_Two_StringsSolution {
public:
    int minDistance(string word1, string word2) {
        int m = word1.size();
        int n = word2.size();
        if (m == 0)
            return n;
        if (n == 0)
            return m;
        int max = 0;
        for (int i = 1; i <= m; i++) {
            int tempMax = 0;
            for (int j = 1; j <= n; j++) {
                if (word1[i - 1] == word2[j - 1]) {
                    tempMax = 1;
                    int tempi = i + 1;
                    int tempj = j + 1;
                    while (tempi <= m && tempj <= n) {
                        if (word1[tempi - 1] == word2[tempj - 1]) {
                            tempi++;
                            tempj++;
                            i++;
                            j++;
                            tempMax++;
                        }
                    }
                }
            }
            if (max < tempMax) {
                max = tempMax;
            }
        }
        return max;
    }
};
