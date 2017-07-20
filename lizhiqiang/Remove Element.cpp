class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        int pos = 0;
        int length = nums.size();
        for (int i = 0; i < length; i++) {
            if (nums[i] != val) {
                nums[pos++] = nums[i];
            }
        }
        return pos;
    }
};
