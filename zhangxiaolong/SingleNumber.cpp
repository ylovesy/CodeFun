//
//  SingleNumber.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/31.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>

using namespace std;
//136. Single Number
//Given an array of integers, every element appears twice except for one. Find that single one.
//Note:
//Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
// [1,1,2,2,3,4,4,5,5]
class IntersectSolution {
public:int singleNumber(vector<int>& nums) {
    int target = 0;
    if (nums.size() == 1) {
        return nums[0];
    }
    sort(nums.begin(), nums.end());
    for (int index = 0; index < nums.size(); index++) {
        if ((index + 1) <= nums.size() && ((nums[index] - nums[index + 1]) == 0)) {
            index++;
        }else{
            target = nums[index];
        }
    }
    return target;
}
};
