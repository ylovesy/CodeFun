class Solution {
public:  
int cntHeight(TreeNode *root) {  
    if(root == NULL) return 0;  
    int l = cntHeight(root->left);  
    int r = cntHeight(root->right);  
    if(l < 0 || r < 0 || abs(l-r) > 1) return -1; //自定义 return -1，表示不平衡的情况  
    else  return max(l, r) + 1;  
}  
bool isBalanced(TreeNode *root) {  
    if(root == NULL) return true;      
    int l = cntHeight(root->left);  
    int r = cntHeight(root->right);  
    if(l < 0 || r < 0 || abs(l-r) > 1) return false;  
    else return true;  
}
};
