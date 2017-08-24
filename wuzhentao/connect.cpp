class Solution {
public:
    void connect(TreeLinkNode *root) {
        if(!root) {
            return;
        }

        TreeLinkNode* p = root;
        TreeLinkNode* first = NULL;
        while(p) {
            //记录下层第一个左子树
            if(!first) {
                first = p->left;
            }
            //如果有左子树，那么next就是父节点
            if(p->left) {
                p->left->next = p->right;
            } else {
                //叶子节点了，遍历结束
                break;
            }

            //如果有next，那么设置右子树的next
            if(p->next) {
                p->right->next = p->next->left;
                p = p->next;
                continue;
            } else {
                //转到下一层
                p = first;
                first = NULL;
            }
        }
    }
};
