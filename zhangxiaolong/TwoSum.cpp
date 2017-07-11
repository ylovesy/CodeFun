//
//  TwoSum.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/11.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <map>

using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int current = 0;
        vector<int> vec;
        map<int,int> m;
        for (int index = 0; index < nums.size(); index++) {
            int val = nums[index];
            m[val] = index;
        }
        for (int index = current; index < nums.size(); index++) {
            int temp = m[(target - nums[index])];
            if (temp > 0 && temp != index) {
                vec.push_back(index);
                vec.push_back(temp);
                return vec;
            }
        }
        return vec;
    }
};
