



# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
    tem = nums;
    n = nums.length
    k = (n +1) /2
    j = n
    tem.sort!

    for i in 1..n 
        nums[i] = i & 1 ? tmp[--j] : tmp[--k]
    end
end


