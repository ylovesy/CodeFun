//
//  Maximum_Subarray.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/20.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//53. Maximum Subarray
//Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
//For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
//the contiguous subarray [4,-1,2,1] has the largest sum = 6.
#include <stdio.h>
#include <vector>

using namespace std;

class Maximum_SubarraySolution {
public:
    int maxSubArray(vector<int>& nums) {
        int res = INT_MAX,current = 0;
        for (int index = 0; index < nums.size(); index++) {
            current = max(current + nums[index], nums[index]);
            res = max(res,current);
        }
        return res;
    }
};
