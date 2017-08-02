# @param {Integer} n
# @return {String}
def convert_to_title(n)
   if n == nil || n == 0
      return ""
    end

    res = ""
    while(n > 0) do
      letter = (n - 1) % 26 + "A".ord
      res = "#{letter.chr}" + res
      n = (n / 26.0).ceil - 1
    end

    res
end




puts convert_to_title(27)