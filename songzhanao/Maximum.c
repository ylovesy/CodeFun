int maximumProduct(int *nums, int numsSize) {
    // 负数考虑，找出最小的两个数字加上最大的三个数字即可 不需要完整排序
    int temp = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = i + 1; j < numsSize; j++) {
            if (nums[i] > nums[j]) {
                temp = nums[j];
                nums[j] = nums[i];
                nums[i] = temp;
            }
        }
    }
    for (int i = numsSize - 1; i > numsSize - 4; i--) {
        for (int j = 0; j < i; j++) {
            if (nums[i] < nums[j]) {
                temp = nums[j];
                nums[j] = nums[i];
                nums[i] = temp;
            }
        }
    }

    int res1 = nums[0] * nums[1] * nums[numsSize - 1];
    int res2 = nums[numsSize - 1] * nums[numsSize - 2] * nums[numsSize - 3];
    return res1 > res2 ? res1 : res2;
}
