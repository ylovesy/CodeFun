//
//  intersectionOfTwoArrays.cpp
//  test
//
//  Created by bailee on 2017/7/28.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "intersectionOfTwoArrays.hpp"
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
        sort(nums1.begin(), nums1.end());
        sort(nums2.begin(), nums2.end());
        nums1.erase(set_intersection(nums1.begin(), nums1.end(), nums2.begin(), nums2.end(), nums1.begin()), nums1.end());
        return nums1;
    }
};