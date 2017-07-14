 /**
  *  * Definition for a binary tree node.
  *   * struct TreeNode {
  *    *     int val;
  *     *     struct TreeNode *left;
  *      *     struct TreeNode *right;
  *       * };
  *        */
struct TreeNode* mergeTrees(struct TreeNode* t1, struct TreeNode* t2) {
    if(!t1) return t2;
    if(!t2) return t1;
    struct TreeNode *result = malloc(sizeof(struct TreeNode));
    result->val = t1->val+t2->val;
    result->left = mergeTrees(t1->left, t2->left);
    result->right = mergeTrees(t1->right, t2->right);
    return result;
}
