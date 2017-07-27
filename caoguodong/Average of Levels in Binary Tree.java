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
        Queue<TreeNode> queue = new LinkedList<>();
        List<Double> resultList = new ArrayList<>();
        queue.offer(root);
        queue.offer(null);
        double sum = 0;
        int size = 0;
        while(queue.size()>0){
            TreeNode treeNode = queue.poll();
            if(treeNode != null){
                if(treeNode.left != null){
                    queue.offer(treeNode.left);   
                }
                
                if(treeNode.right != null){
                    queue.offer(treeNode.right);
                }
                sum = sum + treeNode.val;
                size++;
            } else{
                resultList.add(sum/size);
                sum = 0;
                size =0;
                if(queue.size() > 0){
                    queue.offer(null);   
                }
            }
        }
        return resultList;
    }
}