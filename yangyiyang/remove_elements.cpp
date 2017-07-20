 class Solution {
     public:
     int removeElement(vector<int>& nums, int val) {
             if(nums.size() < 1) return nums.size();
             int index = 0;
             for(int i = 0; i < nums.size(); ++i)
             {
                         if(nums[i] != val)
                         {
                                         nums[index++] = nums[i];
                                     }
                     }
             return index;
         }
 };
