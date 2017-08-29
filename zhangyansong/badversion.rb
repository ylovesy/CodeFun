# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
    low = 1;
    high = n;
    ver = 0;
    while low < high do
        ver = low + (high - low) / 2;
        if isBadVersion(ver) then
            high = ver;
        else
            low = ver + 1;
        }
        return low;
    end
end