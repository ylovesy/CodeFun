public class Solution {
    public boolean canConstruct(String ransomNote, String magazine) {
        
        if(ransomNote == magazine || ransomNote.equals(magazine)){
            return true;
        }
        
        int[] arr = new int[26];
        
        for (int i = 0; i < magazine.length(); i++) {
            arr[magazine.charAt(i) - 'a']++;
        }
        
        for (int i = 0; i < ransomNote.length(); i++) {
            if(--arr[ransomNote.charAt(i)-'a'] < 0) {
                return false;
            }
        }
        
        return true;
    }
}