//
//  Number_of_1_Bits.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/22.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <stdint.h>

using namespace std;

//int hammingWeight(uint32_t n) {
//    int cnt = 0;
//    while (n) {
//        n &= n - 1;
//        cnt++;
//    }
//    return cnt;
//}

class Number_of_1_BitsSolution {
public:
    int hammingWeight(uint32_t n) {
        int count = 0;
        for (int index = 0; index < 64; index++) {
            if (n & 1) {
                count++;
            }
            n = n>>1;
        }
        return count;
    }
};
