//Input:
//3
/// \
//9  20
///  \
//15   7
//Output: [3, 14.5, 11]
//Explanation:
//The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
//Note:
//The range of node's value is in the range of 32-bit signed integer.
//Seen this question in a real interview before?   Yes  No
//Difficulty:Easy
//Total Accepted:8.5K
//Total Submissions:14.7K
//Contributor: yangshun
//Subscribe to see which companies asked this question.
//
//Related Topics
//Tree
//S

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

class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        
        guard root != nil else {
            return []
        }
        var container:[TreeNode] = []
        container.append(root!)
        var result:[Double] = []
        
        
        while !container.isEmpty {
            var nodeSum:Double = 0.0
            let nodeCount = container.count
            
            var index = 0
            while index < nodeCount {
                let node = container.first!
                nodeSum += Double(node.val)
                container.removeFirst()
                if let left = node.left {
                    container.append(left)
                }
                if let right = node.right {
                    container.append(right)
                }
                index += 1
            }
            result.append(nodeSum/Double(nodeCount))
        }
        
        return result
    }
}

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

let s = Solution()
s.averageOfLevels(root)

