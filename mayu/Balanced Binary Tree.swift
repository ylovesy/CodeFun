import Foundation

/*
 
 Add to List
 110. Balanced Binary Tree
 DescriptionHintsSubmissionsDiscussSolution
 Discuss Pick One
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
private class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        let leftCount = deepCount(node: root?.left)
        let rightCount = deepCount(node: root?.right)
        return abs(leftCount - rightCount) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
    }
    func deepCount(node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        return max(deepCount(node:node?.left) + 1, deepCount(node: node?.right) + 1)
    }
}
