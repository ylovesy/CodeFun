# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_smallest(matrix, k)
    if matrix.length == 0 return
    lo, hi = matrix[0][0], matrix[-1][-1]
    while lo <= hi then
        mid = (lo + hi) >> 1
        loc = sum(bisect.bisect_right(m, mid) for m in matrix)
        if loc >= k then
            hi = mid - 1
        else 
            lo = mid + 1
    return lo
end


