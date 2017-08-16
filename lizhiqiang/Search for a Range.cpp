class Solution {
public:
    vector<int> searchRange(vector<int>& nums, int target) {
        int l = 0, r = (int)nums.size()-1;
        vector<int> range{-1, -1};
        if (nums.empty()) return range; 

        while (l < r) {
            int m = l + (r - l)/2;
            nums[m] < target ? l = m+1:r=m;
        }
        if (nums[l] != target) return range;
        range[0] = l;
        r = (int) nums.size()-1;
        while (l < r) {
            int m = l + (r - l)/2+1;
            nums[m] > target ? r=m-1:l=m;
        }
        range[1] = r;
        return range;
   }
    
};
