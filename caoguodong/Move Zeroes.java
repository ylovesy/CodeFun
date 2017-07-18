public class Solution {
    public void moveZeroes(int[] nums) {
        int i=-1;
        for(int j=0; j<nums.length; j++){
            if(nums[j] == 0 && i<0){
                i=j;
            }else if(nums[j] != 0 && i>=0){
                int x = nums[i];
                nums[i] = nums[j];
                nums[j] = x;
                i++;
            }
        }
    }
}