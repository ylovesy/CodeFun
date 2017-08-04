//
//  IsPowerOfTwo.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/4.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
class IsPowerOfTwoSolution {
public:bool isPowerOfTwo(int n) {
    int count = 0;
    while (n > 0) {
        count += (n & 1);
        n >>= 1;
    }
    return count == 1;
}

};
