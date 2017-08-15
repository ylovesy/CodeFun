/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int dfs(TreeNode* root)
    {
        if(root == NULL)
            return 0;
        return max(dfs(root->left), dfs(root->right)) + 1;
    }
    
    bool isBalanced(TreeNode* root)
    {
        if(root == NULL)
            return true;
        if(abs( (dfs(root->left)) - dfs(root->right) ) > 1)
            return false;
        return (isBalanced(root->left) && isBalanced(root->right));
    }
};
