# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    n = nums.length
    res = [-1,-1]
    start = 0
    final = n-1
    while nums[start] < nums[final] do
        mid = start + (final - start)/2
        if nums[mid] > target then
            final = mid - 1
        elsif  nums[mid] < target then
            start = mid + 1
        else
            if nums[start] < target then
                start += 1
            end

            if nums[final] < target then
                final -= 1
            end
        end
        
        if nums[start] == target then
            res[0] = start
            res[1] = final
        end
        return res
    end
end
