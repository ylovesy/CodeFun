//
//  MaximumProduct.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/24.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <set>

using namespace std;

class ThreeSumSolution {
public:int maximumProduct(vector<int>& nums) {
    sort(nums.begin(), nums.end());
    int res;
    if (nums[nums.size() - 1] < 0) {
        res = nums[nums.size() - 3] * nums[nums.size() - 2] * nums[nums.size() - 1];
    }else{
        if (nums[1] < 0) {
            res = max(nums[0] * nums[1] * nums[nums.size() - 1],nums[nums.size() - 3] * nums[nums.size() - 2] * nums[nums.size() - 1]);
        }else{
            res = nums[nums.size() - 3] * nums[nums.size() - 2] * nums[nums.size() - 1];
        }
    }
    //要么是三个最大的正数相乘，要么是两个最小的负数和最大的正数相乘
    //    int a = nums[0] * nums[1] * nums[nums.size()-1];
    //    int b = nums[nums.size()-3] * nums[nums.size()-2] * nums[nums.size()-1];
    //    return max(a,b);
    return res;
}
};

