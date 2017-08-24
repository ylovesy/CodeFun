/**
 * Definition for binary tree with next pointer.
 * struct TreeLinkNode {
 *  int val;
 *  TreeLinkNode *left, *right, *next;
 *  TreeLinkNode(int x) : val(x), left(NULL), right(NULL), next(NULL) {}
 * };
 */
class Solution {
public:
    void connect(TreeLinkNode *root) {
        while (root != NULL) {
            TreeLinkNode *curr = root;
            
            while (curr != NULL && curr->left != NULL) {
                curr->left->next = curr->right;
                curr->right->next = curr->next == NULL ? NULL : curr->next->left;
                curr = curr->next;
            }
            
            root = root->left;
        }
    }
};
