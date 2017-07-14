//
//  MergeTwoBinaryTrees.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/7/14.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>

using namespace std;

// Input:
// Tree 1                    Tree 2
//     1                         2
//    / \                       / \
//   3   2                     1   3
//  /                           \   \
// 5                             4   7
//Output:
//Merged tree:
//     3
//    / \
//   4   5
//  / \   \
// 5   4   7

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class MergeTwoBinaryTreesSolution {
public:
    TreeNode* mergeTrees(TreeNode* t1, TreeNode* t2) {
        if (!t1) return t2;
        if (!t2) return t1;
        TreeNode* newNode = new TreeNode(t1->val + t2->val);
        newNode->left = mergeTrees(t1->left, t2->left);
        newNode->right = mergeTrees(t1->right, t2->right);
        return newNode;
    }
};
