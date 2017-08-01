# Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.

# Note: The solution set must not contain duplicate quadruplets.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
    return [] if nums.size() < 4
    nums.sort!
    num_last = nil
    result = Array.new
    max = nums[-1] * 3
    nums.each_with_index do |num, idx|
        next if num == num_last
        next if num + max < target # too small
        break if num * 4 > target # too large
        target_result = target - num
        three_sum(nums, idx+1, target_result, result)
        num_last = num
    end
    result
end

def three_sum(nums, idx_from_four, target_result, result)
    num_last = nil
    max = nums[-1] * 2
    (idx_from_four..nums.size()-2).each do |idx|
        next if nums[idx] == num_last
        next if nums[idx] + max < target_result # too small
        break if nums[idx] * 3 > target_result # too large
        target = target_result - nums[idx]
        two_sum(nums, idx_from_four, idx+1, target, result)
        num_last = nums[idx]
    end
end

def two_sum(nums, idx_from_four, start, target, result)
  head, tail = start, nums.size() - 1
  while head < tail
    tmp = nums[head] + nums[tail]
    break if nums[tail] * 2 < target # too small 
    break if nums[head] * 2 > target # too large
    if tmp < target
      head += 1
    elsif tmp > target
      tail -= 1
    else
      result << [nums[idx_from_four-1], nums[start-1], nums[head], nums[tail]]
      tmp = head + 1
      while tmp < tail && nums[tmp] == nums[head]
        tmp += 1
      end
      head = tmp
      tmp = tail - 1
      while tmp > head && nums[tmp] == nums[tail]
        tmp -= 1
      end
      tail = tmp
    end
  end
end