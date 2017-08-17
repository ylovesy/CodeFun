# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    m = word1.length
    n = word2.length
    if (m==0) then
        return n
    end
    if (n==0) then
        return m
    end
    dp = Array.new(m+1,Array.new(n+1,0))

    for i in 1..m
        for j in 1..n
            if (word1.split("")[i-1]==word2.split("")[j-1]) then
                dp[i][j]=dp[i-1][j-1]+1;
            else
                dp[i][j]=[dp[i-1][j],dp[i][j-1]].max
            end
        end
        
    end
    maxlen=dp[m][n];
    return (m-maxlen)+(n-maxlen);
end

puts min_distance("eaa","aae")