//
//  threeSum.cpp
//  test
//
//  Created by bailee on 2017/7/21.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "threeSum.hpp"
#include <vector>
#include <algorithm>
#include <math.h>
using namespace std;

class solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        //排序数组
        std::sort(nums.begin(), nums.end());
        
        vector<vector<int>> res;
        int size = (int)nums.size();
        //取第一个数
        for (int i = 0; i < size -2; i++) {
            if (i == 0 || (i > 0 && nums[i] != nums[i-1])) {
                //三个数的和为0，后期可以随意改动
                int sum = 0-nums[i];
                //从剩余的数组两头开始找
                int left = i +1, right = size-1;
                while (left < right) {
                    int tempSum = nums[left] + nums[right];
                    if (tempSum == sum) {
                        vector<int> arr = {nums[i],nums[left],nums[right]};
                        res.push_back(arr);
                        //防止连续的重复的数字
                        while (left < right && nums[left] == nums[left +1]) {
                            left ++;
                        }
                        while (right > left && nums[right] == nums[right -1]) {
                            right --;
                        }
                        //进行下一轮while循环
                        left ++;
                        right --;
                    } else if (tempSum < sum) {
                        left ++;
                    } else {
                        right --;
                    }
                }
            }
        }
        return res;
    }
};
