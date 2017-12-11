class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        front = 0
        end = len(nums) - 1
        while front < end :
            if nums[front] + nums[end] < target :
                front = front + 1
            elif nums[front] + nums[end] > target :
                end = end - 1;
            else :
                return [front, end]
