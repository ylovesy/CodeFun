//
//  ThreeSum.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/21.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <set>

using namespace std;

class ThreeSumSolution {
public:vector<vector<int>> threeSum(vector<int>& nums) {
    vector<vector<int>> resvec;
    if (nums.size() < 3) {
        return resvec;
    }
    sort(nums.begin(), nums.end());
    for (int i = 0; i < nums.size() - 2; i++) {
        for (int j = i + 1; j < nums.size() - 1; j++) {
            for (int k = j + 1; k < nums.size(); k++) {
                if (nums[i] + nums[j] + nums[k] == 0) {
                    vector<int> vec;
                    vec.push_back(nums[i]);
                    vec.push_back(nums[j]);
                    vec.push_back(nums[k]);
                    resvec.push_back(vec);
                }
                while (nums[k] == nums[k + 1]) {
                    k++;
                }
            }
            while (nums[j] == nums[j + 1]) {
                j++;
            }
        }
        while (nums[i] == nums[i + 1]) {
            i++;
        }
    }
    return resvec;
}
};
