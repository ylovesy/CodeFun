public class Solution {
    public String reverseString(String s) {
        StringBuffer buffer = new StringBuffer();
        for(int i=s.length()-1; i>=0;i--){
            buffer.append(s.charAt(i));
        }
        return buffer.toString();
    }
}