//
//  RemoveDuplicates.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/17.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>

using namespace std;

class RemoveDuplicatesSolution {
public:
    int removeDuplicates(vector<int>& nums) {
        vector<int>::iterator header = nums.begin();
        vector<int>::iterator tail = header;
        while (header!= nums.end()) {
            vector<int>::iterator next = header;
            while (*header == *(++next) && (next != nums.end())) {
                tail = next;
            }
            if (header != tail) {
                header = nums.erase(header, tail);
            }else{
                header++;
            }
            tail = header;
        }
        return nums.size();
    }
};
