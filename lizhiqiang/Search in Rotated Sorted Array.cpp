class Solution {
public:
    int search(vector<int>& nums, int target) {
        int front = 0;
        int end = nums.size();
        while (front != end) {
            const int mid = front + (end - front) / 2;
            if (nums[mid] == target) return mid;
            if (nums[front] <= nums[mid]) {
                if (nums[front] <= target && target < nums[mid]) {
                    end = mid;
                } else {
                    front = mid + 1;
                }
            } else {
                if (nums[mid] < target && target <= nums[end - 1]) {
                    front = mid + 1;
                } else {
                    end = mid;
                }
            }
            
        }
        return -1;
    }
};
