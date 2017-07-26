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


class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end
###使用层级遍历解决问题

def average_of_levels(root)
    nodeList = Array.new
    resultList = Array.new
    nodeList.push(root)
    while nodeList.length > 0
        sum = 0.0
        temList = Array.new
        nodeList.each do |node|
            sum += node.val
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
node1 = TreeNode.new(15)
node2 = TreeNode.new(7)
node3 = TreeNode.new(20)
node3.left = node1
node3.right = node2
node4 = TreeNode.new(9)
root  = TreeNode.new(3)
root.left = node4
root.right = node3
average_of_levels(root)
