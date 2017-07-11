public class Solution {
  public int[] twoSum(int[] nums, int target) {
    HashMap<Integer, Integer> hashMap = new HashMap<>();

    for (int i = 0; i < nums.length; i++) {
      hashMap.put(nums[i], i);
    }

    int[] result = new int[2];

    for (int i = 0; i < nums.length; i++) {
      int need = target - nums[i];
      if (hashMap.containsKey(need) && hashMap.get(need) != i) {
        result[0] = i;
        result[1] = hashMap.get(need);
        break;
      }
    }
    return result;
  }
}