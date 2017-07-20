//
//  removeElement.c
//  test
//
//  Created by bailee on 2017/7/20.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "removeElement.h"
int removeElement(int* nums, int numsSize, int val) {
    if (numsSize == 0 || !nums ) {
        return 0;
    }
    int newSize = numsSize;
    for (int i = numsSize-1; i >= 0; i--) {
        if (nums[i] == val) {
            newSize --;
            for (int j = i; j< newSize; j++) {
                nums[j] = nums[j+1];
            }
        }
    }
    return newSize;
}

int removeElementV2(int* nums, int numsSize, int val) {
    if (numsSize == 0 || !nums ) {
        return 0;
    }
    int newSize = 0;
    for (int i = 0; i< numsSize; i++) {
        if (nums[i] != val) {
            nums[newSize] = nums[i];
            newSize ++;
        }
    }
    return newSize;
}
