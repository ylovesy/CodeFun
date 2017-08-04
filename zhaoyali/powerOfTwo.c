//
//  powerOfTwo.c
//  test
//
//  Created by bailee on 2017/8/4.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
//判断 n是否是2的整数次幂
//思路：2的整数次幂 1 2 4 8 16等用二进制数是1 10 100 1000 10000
//里面只有一个1其余全是0，与全是1的二进制数作&运算都是0
bool isPowerOfTwo(int n) {
    if (n <= 0) return false;
    return !(n & (n-1));
}
