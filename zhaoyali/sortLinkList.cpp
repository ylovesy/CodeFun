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
public:
    ListNode * mergeList(ListNode *l1, ListNode *l2) {
        if (!l1 && !l2) return NULL;
        ListNode *res = new ListNode(0);
        while (l1 && l2) {
            if (l1->val < l2->val) {
                res->next = l1;
                l1 = l1->next;
            } else {
                res->next = l2;
                l2 = l2->next;
            }
        }
        //比较完之后可能有一个有剩余
        while (l1) {
            res->next = l1;
            l1 = l1->next;
        }
        while (l2) {
            res->next = l2;
            l2 = l2->next;
        }
        return res->next;
    }
    
    
    ListNode* sortList(ListNode* head) {
        if ( !head || !head->next) return head;
        
        //找linkList的中间节点slow
        ListNode *pre = NULL;
        ListNode *slow = head;
        ListNode *fast = head;
        while (!fast || !fast->next) {
            pre = slow;
            slow = slow->next;
            fast = fast->next->next;
        }
        //找到中间值之后断掉，变成两个link list
        pre->next = NULL;
        
        ListNode *l1 = sortList(head);
        ListNode *l2 = sortList(slow);
        
        ListNode *res = mergeList(l1, l2);
        return res;
    }
};
/*
 if (slow->next) {
 slow = slow->next;
 } else {
 break;
 }
 
 if (fast->next) {
 fast = fast->next;
 if (fast ->next) {
 fast = fast->next;
 } else {
 break;
 }
 } else {
 break;
 }

 */
