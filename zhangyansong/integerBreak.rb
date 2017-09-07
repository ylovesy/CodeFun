# @param {Integer} n
# @return {Integer}
def integer_break(n)
    if(n == 2) return 1;
    if(n == 3) return 2;
    int ret = 1;
    while n>4 then
    ret *= 3;
    n -= 3;
    return ret * n;
end