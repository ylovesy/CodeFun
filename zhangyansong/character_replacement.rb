# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
    if s.length == 0 then 
        return 0 
    end
    
    res = 0
    l = 0
    letters = Array.new(26,0)
    maj = 0

    for 0..s.length then |index|
        c = s.chars[index]
        maj = [maj,letters[c -'A']+=1].max
        w = index - l + 1
        if w - maj <= k then
            res = [w,res].max
        else
            letters[s.chars[l++] - 'A'] -= 1;
        end
    end
    res
end

