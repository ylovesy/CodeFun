


# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
   
    res = nums.min - 1
    curSum = 0
    nums.each do |num|
        curSum = [curSum + num,num].max
        res = [res,curSum].max
    end
    return res
end

def max_sub_array(nums)
    largest_sum = nums.first
    sum = 0
    
    nums.each.with_index do |num, index|
        sum < 0 ? sum = num : sum += num
        largest_sum = sum if sum > largest_sum
    end
    
    largest_sum
end
