//
//  ConvertToTitle.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/2.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <string>

using namespace std;

class FourSumSolution {
public://1 -> A
    //2 -> B
    //3 -> C
    //...
    //26 -> Z
    //27 -> AA
    //28 -> AB
    string convertToTitle(int n) {
        string vec[26] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
        string res;
        int left = n;
        while (left > 0) {
            int mod = (left % 26);
            if (mod == 0) {
                res = vec[25] + res ;
                left = left / 27;
            }else{
                res = vec[mod - 1] + res;
                left = left / 26;
            }
        }
        return res;
    }

};
