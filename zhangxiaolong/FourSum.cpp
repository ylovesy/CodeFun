//
//  FourSum.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/2.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>

using namespace std;

class FourSumSolution {
public:
    //For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
    //A solution set is:
    //[
    // [-1,  0, 0, 1],
    // [-2, -1, 1, 2],
    // [-2,  0, 0, 2]
    // ]
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        vector<vector<int>> resvec;
        if (nums.size() < 4) {
            return resvec;
        }
        sort(nums.begin(), nums.end());
        for (int i = 0; i < nums.size() - 3; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue;//相同就跳过
            }
            for (int j = i + 1; j < nums.size() - 2; j++) {
                if (j > i + 1 && nums[j] == nums[j - 1]) {
                    continue;//相同就跳过
                }
                //求twosum的问题
                int head = j + 1,tail = (int)(nums.size() - 1);
                int temtarget = target - nums[i] - nums[j];
                while (head < tail) {
                    int sum = nums[head] + nums[tail];
                    if (sum < temtarget) {
                        head++;
                    }else if(sum > temtarget){
                        tail--;
                    }else{
                        vector<int> vec;
                        vec.push_back(nums[i]);
                        vec.push_back(nums[j]);
                        vec.push_back(nums[head]);
                        vec.push_back(nums[tail]);
                        resvec.push_back(vec);
                        int k = head + 1;
                        while (k < tail && nums[k] == nums[head]) {
                            k++;
                        }
                        head = k;
                        k = tail - 1;
                        while (k > head && nums[k] == nums[tail]) {
                            k--;
                        }
                        tail = k;
                    }
                }
            }
        }
        return resvec;
    }
};
