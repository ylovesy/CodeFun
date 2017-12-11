class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        first = 0
        last = len(nums)
        while first < last :
            mid = (first + last) / 2
            if nums[mid] == target :
                return mid
            elif nums[mid] < nums[first] :
                if nums[last - 1] >= target and target > nums[mid] :
                    first = mid + 1
                else :
                    last = mid
            elif nums[mid] >= nums[first] :
                if nums[mid] > target and target >= nums[first] :
                    last = mid
                else :
                    first = mid + 1
        return -1
