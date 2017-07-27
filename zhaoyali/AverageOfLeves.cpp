//
//  AverageOfLeves.cpp
//  test
//
//  Created by bailee on 2017/7/26.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include "AverageOfLeves.hpp"
#include <vector>
#include <queue>
using namespace std;

/**
 * Definition for a binary tree node.
 */
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    vector<double> averageOfLevels(TreeNode* root) {
        vector<double> res;
        vector<TreeNode> trees;
        trees.push_back(*root);
        
        while (trees.size()) {
            long size = trees.size();
            long sum = 0;
            for (int i = 0; i< size; i++) {
                //取第一个元素
                TreeNode oneNode = trees.front();
                sum += oneNode.val;
                if (oneNode.left) {
                    trees.push_back(*oneNode.left);
                }
                if (oneNode.right) {
                    trees.push_back(*oneNode.right);
                }
                //去掉第一个元素
                trees.erase(trees.begin());
            }
            res.push_back(sum*1.0/size);
        }
        return res;
        
    }
    
    vector<double> averageOfLevelsV2(TreeNode* root) {
        vector<double> res;
        /*
         * queue默认是使用链表的类型存储，
         * 链表对收尾数据操作很快
         */
        queue<TreeNode*> nodeQueue;
        nodeQueue.push(root);
        
        while (nodeQueue.size()) {
            long size = nodeQueue.size();
            long sum = 0;
            for (int i = 0; i< size; i++) {
                //取第一个元素
                TreeNode oneNode = *nodeQueue.front();
                sum += oneNode.val;
                if (oneNode.left) {
                    nodeQueue.push(oneNode.left);
                }
                if (oneNode.right) {
                    nodeQueue.push(oneNode.right);
                }
                //出栈
                nodeQueue.pop();
            }
            res.push_back(sum*1.0/size);
        }
        return res;
    }
};
