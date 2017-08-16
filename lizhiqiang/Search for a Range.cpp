class Solution {
public:
    vector<int> searchRange(vector<int>& nums, int target) {
        int front = 0;
        int end = nums.size() - 1;
        int num1 = INT_MIN;
        int num2 = INT_MAX;
        vector<int> result;
        
        int mid = nums.size() / 2 - 1;
        while(nums[mid] != target) {
            if (nums[mid] < target) {
                front = mid + 1;
            } else {
                end = mid - 1;
            }
        }
        
        num1 = searchInRange(nums, target, front, mid, false, -1);
        num2 = searchInRange(nums, target, mid, end, true, -1);
        if (num1 >= 0 && num2 >= 0) {
            result.push_back(num1);
            result.push_back(num2);
        }
        
        
        return result;
    }
    
    int searchInRange(vector<int>& nums, int target, int start, int end, bool isSearchMax, int currentPos) {
        int mid = start + ((end - start) / 2);
        if (start < end) {
        if (nums[mid] == target) {
            if (isSearchMax) {
                return searchInRange(nums, target, mid + 1, end, isSearchMax, mid);
            } else {
                return searchInRange(nums, target, start, mid - 1, isSearchMax, mid);
            }
        } else if (nums[mid] < target) {
            return searchInRange(nums, target, mid + 1, end, isSearchMax, currentPos);
        } else {
            return searchInRange(nums, target, start, mid - 1, isSearchMax, currentPos);
        }
        } else {
            return currentPos;
        }
    }
};
