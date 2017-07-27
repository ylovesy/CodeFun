//
//  CanConstruct.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/27.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <map>
#include <string>


using namespace std;

class Solution {
public:
    //"bg"
    //"efjbdfbdgfjhhaiigfhbaejahgfbbgbjagbddfgdiaigdadhcfcj"
    //"fffbfg"
    //"effjfggbffjdgbjjhhdegh"
    bool canConstruct(string ransomNote, string magazine) {
        if (ransomNote.length() == 0 ) {
            return true;
        }
        map<string,int> mapransom;
        map<string,int> mapres;
        for (int index = 0; index < ransomNote.length(); index++) {
            string key = ransomNote.substr(index,1);
            if (mapransom.find(key) == mapransom.end()) {
                mapransom[key] = 1;
                mapres[key] = 0;
            }else{
                mapransom[key] = mapransom[key] + 1;
            }

        }
        for (int index = 0; index < magazine.length(); index++) {
            string key = magazine.substr(index,1);
            if (mapres.find(key) != mapres.end()) {
                mapres[key] = mapres[key] + 1;
            }
        }
        map<string,int>::iterator it = mapres.begin();
        while (it != mapres.end()) {
            string key = it->first;
            if (mapres[key] < mapransom[key]) {
                return false;
            }
            it++;
        }
        return true;
    }};
