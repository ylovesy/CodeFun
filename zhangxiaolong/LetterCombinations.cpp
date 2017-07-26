//
//  LetterCombinations.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/25.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <string>
#include <map>

using namespace std;

class LetterCombinationsSolution {
    public:
    void letterCombinationsDFS(string digits, map<string,vector<string>> maps, int dp, string out, vector<string> &res){
        if (dp == digits.size()) {
            res.push_back(out);
            return;
        }
        string num = digits.substr(dp,1);
        vector<string> vec = maps[num];
        for (int index = 0; index < vec.size(); index++) {
            out.append(vec[index]);
            letterCombinationsDFS(digits, maps, dp + 1, out, res);
            out.pop_back();//回退到上一状态
        }
    }

    vector<string> letterCombinations(string digits) {
        vector<string> res;
        map<string,vector<string>> maps;
        vector<string> vec2;
        vec2.push_back("a");
        vec2.push_back("b");
        vec2.push_back("c");
        maps["2"] = vec2;
        vector<string> vec3;
        vec3.push_back("d");
        vec3.push_back("e");
        vec3.push_back("f");
        maps["3"] = vec3;
        vector<string> vec4;
        vec4.push_back("g");
        vec4.push_back("h");
        vec4.push_back("i");
        maps["4"] = vec4;
        vector<string> vec5;
        vec5.push_back("j");
        vec5.push_back("k");
        vec5.push_back("l");
        maps["5"] = vec5;
        vector<string> vec6;
        vec6.push_back("m");
        vec6.push_back("n");
        vec6.push_back("o");
        maps["6"] = vec6;
        vector<string> vec7;
        vec7.push_back("p");
        vec7.push_back("q");
        vec7.push_back("r");
        vec7.push_back("s");
        maps["7"] = vec7;
        vector<string> vec8;
        vec8.push_back("t");
        vec8.push_back("u");
        vec8.push_back("v");
        maps["8"] = vec8;
        vector<string> vec9;
        vec9.push_back("w");
        vec9.push_back("x");
        vec9.push_back("y");
        vec9.push_back("z");
        maps["9"] = vec9;
        letterCombinationsDFS(digits, maps, 0, "", res);
        return res;
    }
};
