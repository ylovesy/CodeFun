public class Solution {
    public List<List<Integer>> fourSum(int[] nums, int target) {
        List<List<Integer>> result = new ArrayList<>();

        if(nums.length < 4){
            return result;
        }

        Arrays.sort(nums);
        
        int b,c,d;
        for(int i=0; i<nums.length-3;i++){
            b=i+1;
            c=b+1;
            d=c+1;
            
            if(i == 0 || nums[b]>nums[i]){
                while(b<nums.length-3){
                        if(nums[i]+nums[b]+nums[c]+nums[d]==target){
                            if(d== 3 || nums[c]<nums[d]){
                        List<Integer> list = new ArrayList<>();
                        list.add(nums[i]);
                        list.add(nums[b]);
                        list.add(nums[c]);
                        list.add(nums[d]);
                        result.add(list);         
                            }
                         
                        
                        
                        b++;
                        c=b+1;
                        d=c+1;
                        } else if(nums[i]+nums[b]+nums[c]+nums[d]<target){
                            if(d< nums.length-1){
                                d++;                    
                            } else if (d== nums.length -1 && c<nums.length-2){
                                c++;
                                d=c+1;
                            } else if(d== nums.length -1 && c==nums.length-2){
                                b++;
                                c=b+1;
                                d=c+1;
                            }
                        } else{
                            break;
                        }
                    }
            }
        }
        return result;
    }
}