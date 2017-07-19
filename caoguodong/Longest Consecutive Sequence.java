public class Solution {
    public int longestConsecutive(int[] nums) {
        
        if(nums.length == 0){
            return 0;
        }
        
        HashSet<Integer> hashSet = new HashSet<>();
        
        for(int i=0; i<nums.length; i++){
            hashSet.add(nums[i]);
        }
        
        int maxLength=0;
        
        for(int i=0; i<nums.length; i++){
            int length = 1;
            int num = nums[i];
            hashSet.remove(num);
            while(hashSet.contains(--num)){
                hashSet.remove(num);
                length++;
            }
            num = nums[i];
            while(hashSet.contains(++num)){
                hashSet.remove(num);
                length++;
            }
            
            if(length>maxLength){
                maxLength = length;
            }
        }
        
        return maxLength;
    }
}