
Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
Example 1:
Input:
    3
   / \
  9  20
    /  \
   15   7
Output: [3, 14.5, 11]
Explanation:
The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public List<Double> averageOfLevels(TreeNode root) {
        List<Double> resList = new ArrayList<Double>();
    	if (root == null) {
			return resList;
		}
    	ArrayList<TreeNode> aryList = new ArrayList<TreeNode>();
    	aryList.add(root);
    	while (!aryList.isEmpty()) {
			int count = aryList.size();
			double sum = 0.0;
			for (int i = 0; i < count; i++) {
				sum += aryList.get(i).val;
				if (aryList.get(i).left != null) {
					aryList.add(aryList.get(i).left);
				}
				if (aryList.get(i).right != null) {
					aryList.add(aryList.get(i).right);
				}
			}
			for (int i = 0; i < count; i++) {
				aryList.remove(0);
			}
			resList.add(sum / count);
		}
        return resList;
    }
}
