public class Solution {  
    public int lengthOfLIS(int[] nums) {  
        int[] increasing = new int[nums.length];  
        int size = 0;  
        for(int i=0; i<nums.length; i++) {  
            int left=0, right=size-1;  
            while (left<=right) {  
                int m=(left+right)/2;  
                if (nums[i] > increasing[m]) left = m + 1;  
                else right = m - 1;  
            }  
            increasing[left] = nums[i];  
            if (left==size) size ++;  
        }  
        return size;  
    }  
}  
