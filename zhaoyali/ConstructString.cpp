//
//  ConstructString.cpp
//  test
//
//  Created by bailee on 2017/7/27.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "ConstructString.hpp"
#include <string>
#include <vector>
#include <map>
using namespace std;


class Solution {
public:
    bool canConstruct(string ransomNote, string magazine) {
        if (ransomNote.size() > magazine.size())  return false;
        if (ransomNote.size() == 0) return true;
        
        map<char,int> charMap;
        for (int i=0; i<ransomNote.size(); i++) {
            char temp = ransomNote.at(i);
            if (charMap.find(temp) != charMap.end()) {
                charMap[temp] = charMap[temp] +1;
            } else {
                charMap[temp] = 1;
            }
        }
        
        for (int j=0; j<magazine.size(); j++) {
            char temp = magazine.at(j);
            if (charMap.find(temp) != charMap.end()) {
                if (charMap[temp]-1) {
                    charMap[temp] = charMap[temp]-1;
                } else {
                    charMap.erase(charMap.find(temp));
                }
                
            }
        }
        
        if (charMap.empty()) {
            return true;
        } else {
            return false;
        }
    }
};
