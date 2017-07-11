
/*
解题思路：最简单的方法是两层循环去比较，这样时间复杂度是O(n^2)

如果这个题是要返回数字而不是下标的话，有次优解：先排序，排序后记录两个下标，初始分别指向数组头和尾，然后循环（当两个下标没有碰到一起的时候）
如果两个下标的和大于target，说明加多了，指向尾的下标应该减1；如果小于target，说明加少了，指向头的下标应该+1；如果等于target，输出两个数
这种解法时间复杂度是O(nlogn) (实际是排序nlogn + 找数n)

最优解使用哈希表的O(1)复杂度查找能力去解题。哈希表key值是自己的数值，value值是下标。通过查找哈希表确认数组中有没有数与自己相加等于target。
这种方法时间复杂度是O(n)，空间复杂度也是O(n)
*/
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
