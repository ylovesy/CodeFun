public class Solution {  
    public List<List<Integer>> threeSum(int[] num) {  
        List<List<Integer>> res = new ArrayList<List<Integer>>();  
  
        if (num.length < 3) {  
            return res;  
        }  
  
        Arrays.sort(num);  
  
        for (int i = 0; i < num.length - 2; i++) {  
            if (i == 0 || num[i] > num[i - 1]) {  
                int start = i + 1;  
                int end = num.length - 1;  
  
                while (start < end) {  
                    int stand = num[i] + num[start] + num[end];  
                    if (stand == 0) {  
                        ArrayList<Integer> tmp = new ArrayList<Integer>();  
                        tmp.add(num[i]);  
                        tmp.add(num[start]);  
                        tmp.add(num[end]);  
                        res.add(tmp);  
                        start++;  
                        end--;  
                        while (start < end && num[start] == num[start - 1]) {  
                            start ++;  
                        }  
                        while (start < end && num[end] == num[end + 1]) {  
                            end --;  
                        }  
                    } else if (stand > 0) {  
                        end--;  
                    } else {  
                        start++;  
                    }  
                }  
            }  
        }  
  
        return res;  
    }  
}  
