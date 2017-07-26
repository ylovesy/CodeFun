#!/usr/bin/ruby

# Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
# Example 1:
# Input:
#     3
#    / \
#   9  20
#     /  \
#    15   7
# Output: [3, 14.5, 11]
# Explanation:
# The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
# Note:
# The range of node's value is in the range of 32-bit signed integer.
###使用层级遍历解决问题

class Node
 def initialize(value,left,right)
     @value = value
     @left = left
     @right = right
 end

 def value
    @value
 end

 def left
    @left
 end

 def right
    @right
 end
end

def findTreeAverage(root)
    nodeList = Array.new
    resultList = Array.new
    nodeList.push(root)
    while nodeList.length > 0
        sum = 0.0
        temList = Array.new
        nodeList.each do |node|
            sum += node.value
            if node.left
                temList.push(node.left)
            end
            if node.right
                temList.push(node.right)
            end
        end
        resultList.push(sum/nodeList.length)
        nodeList = temList
    end

    puts resultList
end


####test

node1 = Node.new(15,nil,nil)
node2 = Node.new(7,nil,nil)
node3 = Node.new(20,node1,node2)
node4 = Node.new(9,nil,nil)
root  = Node.new(3,node4,node3)

findTreeAverage(root)
