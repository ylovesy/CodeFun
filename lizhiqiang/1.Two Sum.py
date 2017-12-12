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
            
            
class Solution(object):
    def twoSum(self, nums, target):
        sortedNums = sorted(nums)
        i=0
        j=len(nums)-1
        while(j > i):
            if sortedNums[i] + sortedNums[j] > target:
                j = j - 1
            elif sortedNums[i] + sortedNums[j] < target:
                i = i + 1
            else:
                break
        if (i < j) :
            a = -1
            b = -1
            for index , num in enumerate(nums) :
                if num == sortedNums[i] and a == -1 :
                    a = index
                    continue
                if num == sortedNums[j] and b == -1:
                    b = index
                    continue
            return a,b
        return None
        
