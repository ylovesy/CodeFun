#Sort a linked list in O(n log n) time using constant space complexity.


# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end


def do_sort_list(l)
  return [l, l] if l.nil? or l.next.nil?

  # non-max value as divider
  num = l.val
  tmp_node = l.next
  while !tmp_node.nil? and num == tmp_node.val
    tmp_node = tmp_node.next
  end
  if !tmp_node.nil? and tmp_node.val < num
    num = tmp_node.val
  end
  # puts convert_to_array(l).inspect + " | #{num}"

  # less list
  llhead = lltail = nil
  # larger list
  glhead = gltail = nil

  lv = gv = nil
  lsame = gsame = true

  # divide them
  node = l
  until node.nil?
    next_node = node.next

    if node.val <= num    # less part
      if llhead.nil?
        llhead = node
        llhead.next = nil
        lltail = llhead
      else
        node.next = llhead
        llhead = node
      end

      if lsame
        if lv.nil?
          lv = node.val
        else
          if lv != node.val
            lsame = false
          end
        end
      end
    else                        # larger part
      if glhead.nil?
        glhead = node
        glhead.next = nil
        gltail = glhead
      else
        gltail.next = node
        gltail = gltail.next
        gltail.next = nil
      end

      if gsame
        if gv.nil?
          gv = node.val
        else
          gsame = false if gv != node.val
        end
      end
    end

    node = next_node
  end
  # puts " - #{convert_to_array(llhead).inspect}"
  # puts " - #{convert_to_array(glhead).inspect}"

  prehead,pretail = if lsame
                      [llhead, lltail]
                    else
                      do_sort_list llhead
                    end
  posthead,posttail = if gsame
                        [glhead, gltail]
                      else
                        do_sort_list glhead
                      end

  pretail.next = posthead
  return [prehead, posttail]
end

def sort_list(l)
  head,tail = do_sort_list(l)
  head
end

# @param {ListNode} head
# @return {ListNode}
#

#########quickSork
# def quickSort(pBegin,pEnd) 
#     if(pBegin != pEnd) 
#         p = getMiddle(pBegin,pEnd)
#         quickSort(pBegin,p)
#         quickSort(p.next,pEnd)
#     end
# end

# def getMiddle(pBegin,pEnd)
#     key = pBegin.val
#     p = pBegin
#     q = p.next

#     while q!= pEnd
#         if q.val < key 
#             p = p.next
#             tem = p.val
#             p.val = q.val
#             q.val = tem
#         end
#         q = q.next
#     end

#     tem = p.val
#     p.val = pBegin.val
#     pBegin.val = tem
#     return p
# end