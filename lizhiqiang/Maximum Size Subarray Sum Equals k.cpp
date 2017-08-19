class Solution1 {
public:
  int maxSubArrayLen(vector<int> &nums, int k) {
    if (nums.size() == 0)
      return 0;
    unordered_map<int, int> hash;
    int sum = 0, Max = 0;
    hash[0] = 0;
    for (int i = 0; i < nums.size(); i++) {
      sum += nums[i];
      if (hash.count(sum - k))
        Max = max(Max, i - hash[sum - k] + 1);
      if (!hash.count(sum))
        hash[sum] = i + 1;
    }
    return Max;
  }
};
