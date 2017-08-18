class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        if(nums.size()==0) return nums[0];
        
        int res=nums[0];
        int curSum = nums[0];
        for(int i=1;i<nums.size();i++)
        {
            curSum = max(curSum+nums[i],nums[i]);
            res = max(curSum, res);
        }
        return res;
    }
};
