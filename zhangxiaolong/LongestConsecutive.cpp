//
//  LongestConsecutive.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/19.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <set>

using namespace std;
//Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
//For example,
//Given [100, 4, 200, 1, 3, 2],
//The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
//Your algorithm should run in O(n) complexity.
class LongestConsecutiveSolution {
public:
    int longestConsecutive(vector<int>& nums) {
        if (nums.empty()) {
            return 0;
        }
        int res = 1;
        set<int> sets;
        for (int index = 0;index < nums.size(); index++) {
            sets.insert(nums[index]);
        }
        for (int index = 0;index < nums.size(); index++) {
            int current = nums[index];
            sets.erase(current);
            int max = 1;
            int before = current - 1;
            int behand = current + 1;
            while (sets.find(before) != sets.end()) {
                sets.erase(before);
                max++;
                before = before - 1;
            }
            while (sets.find(behand) != sets.end()) {
                sets.erase(behand);
                max++;
                behand = behand + 1;
            }
            if (max > res) {
                res = max;
            }
        }
        return res;
    }
};
