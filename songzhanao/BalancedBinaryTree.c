 int treeDepth(struct TreeNode* root)
{
    if (root == NULL)
        return 0;
    int left = treeDepth(root->left);
    int right = treeDepth(root->right);
    return (left > right) ? (left + 1) : (right + 1);
}
  
bool isBalanced(struct TreeNode* root)
{
    if(root== NULL)
        return true;
    int left = treeDepth(root->left);
    int right = treeDepth(root->right);
    int diff = right - left;
    if (diff > 1 || diff < -1)
        return false;
    return isBalanced(root->left) && isBalanced(root->right);
}
