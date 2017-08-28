class Solution {
public:
    int numDecodings(string s) {
        if(!s || s.length() == 0)
        {
            return  0;
        }
        if(s.charAt(0) == '0')
        {
            return 0;
        }
        int[] dp = new int[s.length()+1];
        dp[0] = 1;
        dp[1] = 1;
        for(int i = 2; i <= s.length(); i ++)
        {
            if(s.charAt(i-1) != '0')
            {
                dp[i] = dp[i-1];
            }
            if(s.charAt(i-2) != '0')
            {
                int temp = Integer.parseInt(s.substring(i-2, i));
                if(temp >0 && temp <= 26)
                {
                    dp[i] += dp[i-2];
                }
            }
        }
        return dp[s.length()];
    }
};
