//
//  Find_All_Numbers_Disappeared_in_an_Array.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/16.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//
//448. Find All Numbers Disappeared in an Array
#include <stdio.h>
#include <vector>
#include <map>

using namespace std;

class Find_All_Numbers_Disappeared_in_an_ArraySolution {
public:
    vector<int> findDisappearedNumbers(vector<int>& nums) {
        vector<int> res;
        map<int,int> maps;
        for (int index = 1; index <= nums.size(); index++) {
            maps[index] = -1;
        }
        for (int index = 1; index <= nums.size(); index++) {
            maps[nums[index]] = nums[index];
        }
        for (int index = 1; index <= nums.size(); index++) {
            if (maps[index] == -1) {
                res.push_back(index);
            }
        }
        return res;
    }
};
