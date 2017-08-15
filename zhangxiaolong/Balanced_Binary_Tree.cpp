//
//  Balanced_Binary_Tree.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/16.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//
//110. Balanced Binary Tree
#include <stdio.h>

/**
 Definition for a binary tree node.
 */
  struct TreeNode {
      int val;
      TreeNode *left;
      TreeNode *right;
      TreeNode(int x) : val(x), left(NULL), right(NULL) {}
  };

class Balanced_Binary_TreeSolution {
public:
    bool isBalanced(TreeNode* root) {
        if (root == NULL) {
            return true;
        }
        int l,r;
        l = height(root->left);
        r = height(root->right);
        if (l > (r + 1) || (r + 1) > l) {
            return false;
        }else{
            return isBalanced(root->left) && isBalanced(root->right);
        }
    }
    int height(TreeNode* root){
        int l,r;
        if (root == NULL) {
            return 0;
        }
        l = height(root->left);
        r = height(root->right);
        return (l > r ? l: r) + 1;
    }
};
