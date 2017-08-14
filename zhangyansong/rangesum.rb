class NumArray

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
        @nums = nums
    end


=begin
    :type i: Integer
    :type val: Integer
    :rtype: Void
=end
    def update(i, val)
        @nums[i] = val
    end


=begin
    :type i: Integer
    :type j: Integer
    :rtype: Integer
=end
    def sum_range(i, j)
        @nums[(i..j)].reduce(:+)
    end


end