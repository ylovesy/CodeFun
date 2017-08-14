# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
    ans = Array.new
    nums.each do |num|
        num = num;  
           
        if(nums[num]>0) then
            nums[num]=-nums[num]
        end
    end

    for(int i=0;i<n;i++)   then
        if(nums[i]>0) then
            ans.push(i+1)
        end
    end
end