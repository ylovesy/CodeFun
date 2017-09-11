# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
    ret = 0
    stk = NSArray.new()

    for i in heights.length
        if stk.length == 0 && stk.last() <= heights[i] then
            stk.push(heights[i])
        else
            count = 0
            while stk.length != 0 && stk.last() then
                count += 1
                ret = [ret, stk.last()*count]
                stk.pop()
            end

            while count then
                count -= 1
                stk.push(heights[i])
            end
        end
    end
    
    int count = 1;
    while !stk.length then
        ret = [ret,stk.last()*count]
        stk.pop()
        count ++
    end
    return ret;
end