// 
int singleNumber(int* nums, int numsSize) {
    int s;
    for (int i = 0; i < numsSize; i++) {
        s = s ^ nums[i];
    }
    return s;
}
