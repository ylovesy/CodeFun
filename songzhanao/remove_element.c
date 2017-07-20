int removeElement(int* nums, int numsSize, int val) {
    int length = numsSize;
    for(int i = 0;i<numsSize;i++){
        if(nums[i]==val){
            length--;
        } else {
            nums[i+length-numsSize] = nums[i];
        }
    }
    return length;
}
