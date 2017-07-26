 /**
  *  * Definition for a binary tree node.
  *   * struct TreeNode {
  *    *     int val;
  *     *     TreeNode *left;
  *      *     TreeNode *right;
  *       *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
  *        * };
  *         */
class Solution {
    public:
    vector<double> averageOfLevels(TreeNode* root) {
            vector<double> result;

            queue<TreeNode*> que;
            que.push(root);
            TreeNode *temp;

            while(!que.empty())
            {
                        int count = que.size();
                        double sum = 0;

                        for(int i = 0; i < count; i++)
                        {
                                        temp = que.front();
                                        que.pop();

                                        sum += temp->val;
                                        if(temp->left != NULL) que.push(temp->left);
                                        if(temp->right != NULL) que.push(temp->right);
                                    }

                        result.push_back(sum/count);
                    }

            return result;
        }

};
