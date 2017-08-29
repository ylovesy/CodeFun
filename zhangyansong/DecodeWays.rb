# A 

# @param {String} s
# @return {Integer}
def num_decodings(s)
    if !s || s.length ==0 then
        return 0
    end

    if s.chars[0] == '0' then
        return 0
    end

    num1=1;  
    num2=1;  
    num3=1;  

    for i in 1..s.length - 1
        if s.chars[i] == '0' then
            if s.chars[i-1] =='1' ||s.chars[i-1] == '2' then
                num3 = num1
            else
                return 0
            end
        else

            if s.chars[i-1] =='0' ||s.chars[i-1] >= '3' then
                num3 = num2
            else
                if s.chars[i-1] =='2' &&s.chars[i] >= '7' && s.chars[i]<='9' then
                    num3 = num2
                else
                    num3 = num1+num2
                end
            end

        end
        num1 = num2;  
        num2 = num3;  
    end

    return num2

end


def best_num_decodings(s)
    n = s.size
    return 0 if n == 0
    memo = Array.new(n+1, 0)
    memo[n] = 1
    memo[n-1] = s[n-1] != '0' ? 1 : 0
    (n-2).downto(0).each do |i|
        if s[i] == '0'
            next
        else
            memo[i] = s[i,2].to_i <= 26 ? memo[i+1]+memo[i+2] : memo[i+1]
        end
    end
    return memo[0]
end