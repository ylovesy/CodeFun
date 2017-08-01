//
//  fourSum.cpp
//  test
//
//  Created by bailee on 2017/8/1.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include <stdio.h>
#include <vector>
using namespace std;

class Solution {
public:
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        vector<vector<int>> res;
        if (nums.size() < 4) {
            return res;
        }
        std::sort(nums.begin(), nums.end());
        
        for (int i=0; i<nums.size()-3; i++) {
            //至少走一遍循环，后面的去重
            if (i>0 && nums[i]== nums[i-1]) continue;
            
            vector<vector<int>> temp = threeSum(nums, i+1, target-nums[i]);
            for (int j=0; j<temp.size(); j++) {
                vector<int> fourNum = temp[j];
                fourNum.push_back(nums[i]);
                res.push_back(fourNum);
            }
        }
        
        return res;
    }
    
    vector<vector<int>> threeSum(vector<int>& nums,int startIndex, int target) {
        vector<vector<int>> res;
        
        if ( startIndex+3 > nums.size() ) return res;
        
        //排序数组，已经是很排好序的数组了
        
        int size = (int)nums.size();
        //取第一个数
        for (int i = startIndex; i < size -2; i++) {
            ////至少走一遍循环，后面的去重
            if (i == startIndex || (i > startIndex && nums[i] != nums[i-1])) {
                //三个数的和为target
                int sum = target-nums[i];
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
