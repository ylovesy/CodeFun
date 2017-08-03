 /**
  *  * Definition for singly-linked list.
  *   * struct ListNode {
  *    *     int val;
  *     *     ListNode *next;
  *      *     ListNode(int x) : val(x), next(NULL) {}
  *       * };
  *        */
class Solution {
    public:
    ListNode *sortList(ListNode *head)
    {
            if (head == NULL || head->next == NULL) return head;
            ListNode *middle = findMiddle(head);
            ListNode *head2 = middle->next;
            middle->next = nullptr;
            ListNode *l1 = sortList(head);
            ListNode *l2 = sortList(head2);
            return mergeTwoLists(l1, l2);
        }

    private:
    static ListNode *mergeTwoLists(ListNode *l1, ListNode *l2)
    {
            ListNode dummy(-1);
            for (ListNode* p = &dummy; l1 != nullptr || l2 != nullptr; p = p->next)
            {
                        int val1 = l1 == nullptr ? INT_MAX : l1->val;
                        int val2 = l2 == nullptr ? INT_MAX : l2->val;
                        if (val1 <= val2) {
                                        p->next = l1;
                                        l1 = l1->next;
                                    } else {
                                                    p->next = l2;
                                                    l2 = l2->next;
                                                }
                    }
            return dummy.next;
        }

static ListNode* findMiddle(ListNode* head) {
        if (head == nullptr) return nullptr;
        ListNode *slow = head;
        ListNode *fast = head->next;
        while (fast != nullptr && fast->next != nullptr) {
                    slow = slow->next;
                    fast = fast->next->next;
                }
        return slow;
    }
};
