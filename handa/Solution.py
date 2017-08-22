#!/usr/bin/python


class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution(object):
    def deleteDuplicates(self, head):
        """
        82. Remove Duplicates from Sorted List II
        :type head: ListNode
        :rtype: ListNode
        """
        if None == head or None == head.next:  
            return head  
  
        new_head = ListNode(-1)  
        new_head.next = head  
        parent = new_head  
        cur = head  
        while None != cur and None != cur.next:
            if cur.val == cur.next.val:  
                val = cur.val  
                while None != cur and val == cur.val:
                    cur = cur.next  
                parent.next = cur  
            else:  
                cur = cur.next  
                parent = parent.next  
  
        return new_head.next 

    def deleteDuplicatesBest(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        prehead = ListNode(None)
        prehead.next = head
        prev, cur = prehead, head
        while cur:
            t = cur.val
            nxt = cur.next
            if nxt and nxt.val == t:
                cur = nxt.next
                while cur and cur.val == t:
                    cur = cur.next
            else:
                prev.next = cur
                prev, cur = cur, cur.next
        prev.next = None
        return prehead.next
