class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int n = nums.size();
        if(n == 0)
            return 0;
        if(n == 1)
            return nums[0];
        int max = 0x80000001;
        int sum = 0;
        for(int i =0;i<n;++i){
            for(int j=0;j<n;++j){
                sum = 0;
                for(int k=i;k<=j;++k){
                    sum += nums[k];
                }
                if(sum > max)
                    max = sum;
            }
        }
        return max;
    }
};
