# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)

     if !head||!head.next then
        return head
    end

    now = ListNode.new(head.val - 1)
    now.next = head;
    pre = now
    result = now
    

   

    while now&&now.next do
        if now.val == now.next.val then
            while now.next && now.val == now.next.val do
                now=now.next;
            end

            pre.next = now.next
            now = now.next
        else
            pre = now
            now = now.next

        end
    end

    return result.next
end



def delete_duplicates_best(head)
  return head if head.nil? || head.next.nil?
  dummy = ListNode.new(nil)
  dummy.next = head
  f, s = dummy, head.next
  duplicate = false
  while s
    if f.next.val == s.val
      duplicate = true
    else
      if duplicate
        f.next = s
        duplicate = false
      else
        f = f.next
      end
    end
    s = s.next
  end
  f.next = nil if duplicate
  dummy.next
end
