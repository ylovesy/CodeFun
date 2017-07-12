//
//  ReverseString.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/12.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <string>
#include <stack>

using namespace std;

string reverseString(string s) {
    string res;
    long index = 0;
    while (index < s.length()) {
        res+= s[s.length() - 1 - index];
        index++;
    }
    return res;
}

string reverseString_Stack(string s) {
    string res;
    long index = 0;
    stack<char> S;
    while (index < s.length()) {
        S.push(s[index]);
        index++;
    }
    while (!S.empty()) {
        res += S.top();
        S.pop();
    }
    return res;
}
