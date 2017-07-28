public class Solution {
    public int[] intersect(int[] nums1, int[] nums2) {
        
        List<Integer> result = new LinkedList<>();
        
        HashMap<Integer, Integer> map = new HashMap<>();
        
        for(int i=0; i<nums1.length; i++){
            int key = nums1[i];
            if(map.containsKey(key)){
                int count = map.get(key);
                map.put(key, ++count);
            }else{
                map.put(key, 1);
            }
        }
        
        for(int i=0; i<nums2.length; i++){
            int key = nums2[i];
            if(map.containsKey(key) && map.get(key) > 0){
                result.add(key);
                int count = map.get(key);
                map.put(key, --count);
            }
        }
        
        int[] result_array = new int[result.size()];
        
        for(int i=0; i< result_array.length;i++){
            result_array[i] = result.get(i);
        }
        
        return result_array;
    }
}