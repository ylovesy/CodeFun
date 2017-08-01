# Gi# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
    return nums.reduce(:^)
end