int removeElement(int* nums, int numsSize, int val) {
    int length = 0;
    for(int i = 0; i < numsSize; i++) {
        if(nums[i] != val){
            nums[length++] = nums[i];
        }
    }
    return length;
}
