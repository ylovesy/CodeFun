//
//  singleNumber.c
//  LianJiaShell
//
//  Created by bailee on 2017/7/31.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include <stdio.h>
int singleNumber(int* nums, int numsSize) {
    int res = 0;
    for (int i = 0; i< numsSize; i++) {
        res = res ^nums[i];
    }
    return res;
}
