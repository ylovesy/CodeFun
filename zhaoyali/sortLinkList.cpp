//
//  sortLinkList.cpp
//  test
//
//  Created by bailee on 2017/8/3.
//  Copyright © 2017年 bailee. All rights reserved.
//

#include <stdio.h>
#include <vector>
using namespace std;
/**
 * Definition for singly-linked list.
 */
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};
class Solution {
private:
    /*
     * 合并有序数组也是类似的思路
     * 这里注意对指针的操作，C中对NUll->next是不合法的
     */
    ListNode * mergeList(ListNode *l1, ListNode *l2) {
        if (!l1 && !l2) return NULL;
        
        //这里因为只有内部的sortList方法调用，此时l1和l2已经是有序了，不用再判断是否有序，如果移动到别处使用就要考虑是否需要判断是否有序的性质
        
        
        ListNode *res = new ListNode(0);//创建自己的节点方便开始link list
        ListNode *temp = res;//link list的最后节点
        while (l1 && l2) {
            if (l1->val < l2->val) {
                temp->next = l1;
                l1 = l1->next;
            } else {
                temp->next = l2;
                l2 = l2->next;
            }
            temp = temp->next;//更新最后节点的指针
        }
        //比较完之后可能其中一个list有剩余
        while (l1) {
            temp->next = l1;
            l1 = l1->next;
            temp = temp->next;
        }
        while (l2) {
            temp->next = l2;
            l2 = l2->next;
            temp = temp->next;
        }
        return res->next;//最后返回新link list的第二节点指针
    }
    
public:
    
    ListNode* sortList(ListNode* head) {
        if ( !head || !head->next) return head;
        
        //找linkList的中间节点slow
        ListNode *pre = NULL;
        ListNode *slow = head;
        ListNode *fast = head;
        while (fast && fast->next) {
            pre = slow;
            slow = slow->next;
            fast = fast->next->next;//条件保证fast->next为真，null->next不允许，给空指针发消息会crash不同于OC
        }
        //找到中间值之后断掉，变成两个link list
        pre->next = NULL;
        
        ListNode *l1 = sortList(head);
        ListNode *l2 = sortList(slow);
        
        ListNode *res = mergeList(l1, l2);
        return res;
    }
};
