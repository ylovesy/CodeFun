//
//  converToTitle.cpp
//  test
//
//  Created by bailee on 2017/8/3.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "converToTitle.hpp"
#include <string>
using namespace std;

class Solution {
public:
    string multiply(string num1, string num2) {
        int size1 = (int)num1.size();
        int size2 = (int)num2.size();
        
        if (size1 == 0 || size2 == 0 ) {
            return "0";
        }
        
        //初始化数组
        int res[size1 +size2];
        for (int i=0; i< size1+size2; i++) {
            res[i] = 0;
        }
        
        for (int i=size1-1; i >= 0; i--) {
            for (int j=size2-1; j>=0; j--) {
                int temp = (num2.at(j) - '0') * (num1.at(i) - '0');
                int sum = temp + res[i+j+1];
                res[i+j] += sum/10;//这里是+=，因为可能在算前一位时有进位
                res[i+j+1] = (sum)%10;
            }
        }
        
        string resChar;
        bool shouldStart = false;//从不为0的数开始添加
        for (int i =0 ; i < size2 +size1; i++) {
            if (res[i] > 0) shouldStart = true;
            if (shouldStart) {
                char temp = (char)res[i] + '0';
                resChar.append(&temp);
            }
        }
        
        //返回时也要判断字符串的长度，因为可能得到的res的元素全为0
        return resChar.size() > 0 ? resChar : "0";
    }
};
