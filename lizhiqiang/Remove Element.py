class Solution:
    def removeElement(self, nums, val):
        """
        :type nums: List[int]
        :type val: int
        :rtype: int
        """
        length = len(nums)
        times = 0
        if not nums: return 0
        for index, num in enumerate(nums):
            if num == val:
                while nums[length - times - 1] == val and length - times - 1 > 0 :
                    times = times + 1
                if length - times - 1 < index :
                    break
                nums[index] = nums[length - times - 1]
                times = times + 1
            if index > length - times - 1:
                break
        return len(nums) - times
