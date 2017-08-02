//
//  converToTitle.cpp
//  test
//
//  Created by bailee on 2017/8/3.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "converToTitle.hpp"
#include <string>
#include <math.h>
//#include<iostream.h>
using namespace std;

class Solution {
public:
    string convertToTitleV2(int n) {
        if (n<= 0) return "";
        char lastLetter = n%26 ==0 ? 'Z':'A'-1+n%26;
        return convertToTitle((n-1) / 26 ) + lastLetter;
    }
};
