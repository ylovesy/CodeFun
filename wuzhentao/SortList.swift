public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var node = head
        var ary = [Int]()
        while node != nil {
            ary.append((node?.val)!)
            node = node?.next
        }
        ary = ary.sorted()
        var node1 = head
        for num in ary {
            node1?.val = num
            node1 = node1?.next
        }
        return head
    }
}
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var prev = head, slow = head, fast = head
        while fast != nil, fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        
        let firstHalf = sortList(head)
        let secondHalf = sortList(slow)
        return mergeTwoLists(firstHalf, secondHalf)
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = ListNode(0)
        var head = result
        var l1 = l1
        var l2 = l2
        while l1 != nil, l2 != nil {
            if l1!.val < l2!.val {
                head.next = l1
                l1 = l1?.next
            } else {
                head.next = l2
                l2 = l2?.next
            }
            head = head.next!
        }
        head.next = l1 != nil ? l1 : l2
        return result.next
    }
}



let l1 = ListNode(10)
let l2 = ListNode(8)
let l3 = ListNode(14)
let l4 = ListNode(2)
let l5 = ListNode(9)
let l6 = ListNode(15)
let l7 = ListNode(4)
let l8 = ListNode(6)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
l5.next=l6
l6.next=l7
l7.next=l8

let s = Solution()
let ll = s.sortList(l1)
print(ll as Any)

