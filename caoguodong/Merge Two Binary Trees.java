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
  public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
    TreeNode result = null;
    if (t1 != null && t2 != null) {
      result = new TreeNode(t1.val + t2.val);
      recursion(t1, t2, result);
    } else if (t1 != null) {
      result = t1;
    } else if (t2 != null) {
      result = t2;
    }
    return result;
  }

  public static void recursion(TreeNode t1, TreeNode t2, TreeNode result) {

    if (t1.left != null && t2.left != null) {
      result.left = new TreeNode(t1.left.val + t2.left.val);
    } else if (t1.left != null) {
      result.left = t1.left;
    } else if (t2.left != null) {
      result.left = t2.left;
    }

    if (result.left != null && result.left != t1.left && result.left != t2.left) {
      recursion(t1.left, t2.left, result.left);
    }

    if (t1.right != null && t2.right != null) {
      result.right = new TreeNode(t1.right.val + t2.right.val);
    } else if (t1.right != null) {
      result.right = t1.right;
    } else if (t2.right != null) {
      result.right = t2.right;
    }

    if (result.right != null && result.right != t1.right && result.right != t2.right) {
      recursion(t1.right, t2.right, result.right);
    }
  }
}