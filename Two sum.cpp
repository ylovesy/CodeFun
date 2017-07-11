class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<int> result;
        unordered_map<int,int> resultMap;
        for (int i = 0; i < nums.size(); i++) {
            if (resultMap.find(target - nums[i]) != resultMap.end()) {
                result.push_back(i);
                result.push_back(resultMap[target - nums[i]]);
                break;
            }
            resultMap[nums[i]] = i;
        }
        return result;
    }
};
