public class Solution {
    public String convertToTitle(int n) {
        String result = "";
        if(n>26){
            int i = n%26==0?n/26-1:n/26;
            result += convertToTitle(i);
            n=n-26*i;
        }
        result += String.valueOf((char)(n+64));
        return result;
    }
}