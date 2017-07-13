public class Solution {
    public int hammingDistance(int x, int y) {
        int z = ((x|y)&(~(x&y)));
        int result = 0;
        while(z != 0){
            int exr= z % 2;
            z = (z - exr) / 2;
            result+=exr;
        }
        return result;
    }
}