# @param {String} p
# @return {Integer}
def find_substring_in_wrapround_string(p)

    array = Array.new(p.length)
    count = Array.new(26)

    for i in 0..p.length
        array = p.chars[i] - 'a'
    end
    res = 0
    maxLen = 0

    for i in 0..p.length
        if i>0 &&(array[i-1] + 1)%26 == array[i] then
            maxLen += 1
        else
            maxLen = 1
        end
        count[array[i]] = [count[array[i]],maxLen].max
    end
    
    for( int i=0;i<p.length();i++ ){
        if( i>0 && (p_int[i-1] + 1) % 26 == p_int[i]){
            maxLen ++ ;
        } else{
            maxLen = 1;
        }
        count[p_int[i]] = Math.max(count[p_int[i]],maxLen);
    }
    for( int i=0;i<26;i++)
        res += count[i];
    return res;

end