//
//  AverageOfLevels.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/26.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>
#include <string>
#include <queue>

using namespace std;
//Input:
//     3
//   /  \
//  9   20
// / \ /  \
//10 8 15  7
//Output: [3, 14.5, 11]
// Definition for a binary tree node.
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};


class LetterCombinationsSolution {
public:vector<double> averageOfLevels(TreeNode* root) {
    deque<TreeNode *> q_first, q_second;
    vector<double> res;
    q_first.push_back(root);
    res.push_back(root->val);
    while (!q_first.empty()) {
        double sum = 0;
        double count = 0;
        while (!q_first.empty()) {
            TreeNode *temp = q_first.front();
            q_first.pop_front();
            if (temp->left) {
                q_second.push_back(temp->left);
                sum += temp->left->val;
                count++;
            }
            if (temp->right) {
                q_second.push_back(temp->right);
                sum += temp->right->val;
                count++;
            }
        }
        swap(q_first, q_second);//交换两个层级
        if (count > 0) {
            res.push_back(sum/count);
        }
    }
    return res;
    }
};
