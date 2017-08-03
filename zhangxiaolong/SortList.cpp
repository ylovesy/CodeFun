//
//  Sort List.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/4.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>


//148. Sort List
//Sort a linked list in O(n log n) time using constant space complexity.
//Definition for singly-linked list.
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class SortListSolution {
public:
    ListNode* merge(ListNode* lo,ListNode* mi){
    ListNode* tem1 = lo;
    ListNode* tem2 = mi;
    ListNode* res = NULL;
    ListNode* curr = NULL;
    while (tem1 !=NULL && tem2!=NULL) {
        if (tem1->val < tem2->val) {
            ListNode* node = new ListNode(tem1->val);
            if (res == NULL) {
                res = node;
                curr = res;
            }else{
                curr->next = node;
                curr = node;
            }
            tem1 = tem1->next;
        }else{
            ListNode* node = new ListNode(tem2->val);
            if (res == NULL) {
                res = node;
                curr = node;
            }else{
                curr->next = node;
                curr = node;
            }
            tem2 = tem2->next;
        }
    }
    while (tem1 !=NULL) {
        ListNode* node = new ListNode(tem1->val);
        if (res == NULL) {
            res = node;
            curr = node;
        }else{
            curr->next = node;
            curr = node;
        }
        tem1 = tem1->next;
    }
    while (tem2!=NULL) {
        ListNode* node = new ListNode(tem2->val);
        if (res == NULL) {
            res = node;
            curr = node;
        }else{
            curr->next = node;
            curr = node;
        }
        tem2 = tem2->next;
    }
    return res;
}

    ListNode* mergeSort(ListNode* l){
        if (l == NULL) {
            return NULL;
        }
        if (l->next == NULL) {
            return new ListNode(l->val);
        }
        ListNode* p = l;
        int length = 0;
        while (p != NULL) {
            length++;
            p = p->next;
        }
        p = l;
        ListNode* left = new ListNode(p->val);
        p = p->next;
        int index = 1;
        while (index < length * 0.5) {
            left->next = new ListNode(p->val);
            p = p->next;
            index++;
        }
        ListNode* right = NULL;
        while (p != NULL) {
            ListNode* node = new ListNode(p->val);
            if (right == NULL) {
                right = node;
            }else{
                right->next = node;
            }
            p = p->next;
        }

        left = mergeSort(left);
        right = mergeSort(right);
        return merge(left,right);
    }
    
    ListNode* sortList(ListNode* head) {
        return mergeSort(head);
    }
};
