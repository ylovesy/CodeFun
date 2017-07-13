/*
解题思路：最笨的办法是一个一个比较，比较到了一样的，就把后面的所有数字整体前移，依次循环，这样的时间复杂度很高，是O(n^2)。
更好的思路，既然每次遇见重复的元素都要移动后面元素的位置，可以让移动一步到位，具体做法是设一个count变量，含义是目前位置上重复数的个数（应该被删除的个数）
这个数等价于下一个不重复的元素应该往前移动的位数（前面有几个被删了，就应该前移几位）
所以，一次遍历就能将所有数移动到位
*/
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int length = nums.size();
        int count = 0;
        for (int i = 1; i < length; i++) {
            if (nums[i - 1] == nums[i]) {
                count++;
            } else {
                nums[i - count] = nums[i];
            }
        }
        return length - count;
    }
};
