//自己的笨办法，空间换时间，但耗时不错
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        vector<int> middle;
        for (int i = 0; i < nums.size(); i++) {
            if (nums[i] != 0) {
                middle.push_back(nums[i]);
            }
        }
        int zeroCount = nums.size() - middle.size();
        for (int i = 0; i < zeroCount; i++) {
            middle.push_back(0);
        }
        nums = middle;
    }
};

//真正优化的算法
class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        int j = 0;
        for(int i = 0; i < nums.size(); i++)
        {
            if(nums[i])
            {
                nums[j++] = nums[i];
            }
        }
        while(j < nums.size())
        {
            nums[j++] = 0;
        }
    }
};
