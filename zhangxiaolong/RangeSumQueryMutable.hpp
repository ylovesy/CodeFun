//
//  RangeSumQueryMutable.hpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/13.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#ifndef RangeSumQueryMutable_hpp
#define RangeSumQueryMutable_hpp

//307. Range Sum Query - Mutable

#include <stdio.h>
#include <vector>

using namespace std;
class NumArray {
public:
    int lowbit(int i){
        return i&(-i);
    }
    NumArray(vector<int> nums) {
        this->nums = nums;
        sums.resize(nums.size()+1, 0);
        int length = nums.size();
        for (int index = 0; index < length; index++) {
            update(index, nums[index]);
        }
    }
    void update(int i, int val) {
        setSum(i + 1,val - nums[i]);
        nums[i] = val;
    }

    int sumRange(int i, int j) {
        return getSum(j + 1) - getSum(i);
    }

    void setSum(int i,int val){
        while (i <= nums.size()) {
            sums[i] = sums[i] + val;
            i = i + lowbit(i);
        }
    }

    int getSum(int i){
        int sum = 0;
        while (i > 0) {
            sum += sums[i];
            i = i - lowbit(i);
        }
        return sum;
    }
private:
    vector<int> nums;
    vector<int> sums;
};

#endif /* RangeSumQueryMutable_hpp */
