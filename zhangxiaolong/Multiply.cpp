//
//  Multiply.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/8.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <string>
#include <vector>

using namespace std;

class MultiplySolution {
public: string multiply(string num1, string num2) {
    int n1 = num1.size(), n2 = num2.size();
    vector<int> tmpres(n1+n2, 0);
    int k = n1 + n2 - 2;
    for(int i = 0; i < n1; i++)
        for(int j = 0; j < n2; j++)
            tmpres[k-i-j] += (num1[i]-'0')*(num2[j]-'0');
    int carryBit = 0;
    for(int i = 0; i < n1+n2; i++)
    {
        tmpres[i] += carryBit;
        carryBit = tmpres[i] / 10;
        tmpres[i] %= 10;
    }
    int i = k+1;
    while(tmpres[i] == 0)i--;
    if(i < 0)return "0";
    string res;
    for(; i >= 0; i--)
        res.push_back(tmpres[i] + '0');
    return res;}

};
