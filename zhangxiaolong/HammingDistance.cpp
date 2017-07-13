//
//  HammingDistance.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/13.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <queue>

using namespace std;

class HammingDistanceSolution {
public:
    int hammingDistance(int x, int y) {
        int count = 0;
        queue<int>  queue1;
        queue<int>  queue2;

        while (x) {
            queue1.push((x % 2));
            x = x / 2;
        }
        while (y) {
            queue2.push((y % 2));
            y = y / 2;
        }
        while (!queue1.empty() || !queue2.empty()) {
            if (!queue1.empty() && !queue2.empty()) {//两个不为空且相同位置的数不同
                if (queue1.front() != queue2.front()) {
                    count++;
                }
            }else if ((!queue1.empty() && queue1.front() != 0) || (!queue2.empty() && queue2.front() != 0)){
                count++;
            }
            if (!queue1.empty()) {
                queue1.pop();
            }
            if (!queue2.empty()) {
                queue2.pop();
            }
        }
        return count;
    }
};
