//
//  RemoveElement.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/20.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>

using namespace std;

class RemoveElementSolution {
public:
    int removeElement(vector<int>& nums, int val) {
        //    {3,2,1,3,2,4,3,5}
        //    {2,3,1,3,2,4,3,5}
        //    {2,1,3,3,2,4,3,5}
        //    {2,1,2,3,3,4,3,5}
        //    {2,1,2,4,3,3,3,5}
        //    {2,1,2,4,5,3,3,3}

        int j = 0;
        for(int i = 0; i < nums.size(); i++){
            if (val != nums[i]) {
                int temp = nums[j];
                nums[j++] = nums[i];
                nums[i] = temp;
            }
        }
        return j;
    }
};
