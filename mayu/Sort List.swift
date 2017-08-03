import Foundation

/*
 
 Add to List
 148. Sort List
 Sort a linked list in O(n log n) time using constant space complexity.
 */

 private class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
          self.val = val
         self.next = nil
     }
 }

private class Solution {
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
