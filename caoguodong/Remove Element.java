public class Solution {
    public int removeElement(int[] nums, int val) {
        if(nums == null || nums.length == 0){
            return 0;
        }
        int length = -1;
        for(int i=0;i<nums.length;i++){
            if(nums[i] == val && length < 0){
                length = i;
            }
            
            if(nums[i] != val && length >=0){
                int par = nums[i];
                nums[i] = nums[length];
                nums[length] = par;
                length++;
            }
        }
        if(length < 0){
            return nums.length;
        }
        return length;
    }
}