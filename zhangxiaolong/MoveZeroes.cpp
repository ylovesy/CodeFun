//
//  MoveZeroes.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/18.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>

using namespace std;

class MoveZeroesSolution {
public:
    void moveZeroes(vector<int>& nums) {
        for (int i = 0 ,j = 0; i < nums.size(); i++) {
            if (nums[i]) {
                int temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
                j++;
            }
        }
    }
};
