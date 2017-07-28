//
//  Intersect.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/29.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <unordered_map>
#include <string>
#include <vector>

using namespace std;

class IntersectSolution {
public:
    //Given two arrays, write a function to compute their intersection.
    //Example:
    //Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
    //Note:
    //Each element in the result should appear as many times as it shows in both arrays.
    //The result can be in any order.
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
        vector<int> res;
        unordered_map<int, int> map;
        for (int index = 0; index < nums1.size(); index++) {
            map[nums1[index]]++;
        }
        for (auto v: nums2) {
            if (map[v] > 0) {
                res.push_back(v);
                map[v]--;
            }
        }
        return res;
    }
};

