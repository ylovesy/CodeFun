//
//  maxProduct.c
//  test
//
//  Created by bailee on 2017/7/24.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "maxProduct.h"
#include<limits.h>
#include <math.h>

int maximumProduct(int* nums, int numsSize) {
    if (numsSize < 3) {
        return 0;
    }
    int max1 = INT_MIN, max2 = INT_MIN, max3 = INT_MIN;//max3是做大的值
    int min1 = INT_MAX, min2 = INT_MAX, min3 = INT_MAX;//min3是做小的值
    for (int i = 0; i < numsSize; i++) {
        int temp = nums[i];
        
        if (temp > max3) {
            max1 = max2;
            max2 = max3;
            max3 = temp;
        } else if (temp > max2) {
            max1 = max2;
            max2 = temp;
        } else if (temp > max1) {
            max1 = temp;
        }
        
        if (temp < min3) {
            min1 = min2;
            min2 = min3;
            min3 = temp;
        } else if (temp < min2) {
            min1 = min2;
            min2 = temp;
        } else if (temp < min1) {
            min1 = temp;
        }
    }
    if (max3*max1*max2 > max3 *min3*min2) {
        return max3*max1*max2;
    } else {
        return max3 *min3*min2;
    }
}
