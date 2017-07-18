
//1.计0法
void moveZeroes(int* nums, int numsSize) {
    int zeroCount;
    int k = 0;
    
    for (int i = 0; i < numsSize; i ++) {
        if(nums[i] == 0) {
            zeroCount ++;
            
        } else {
            nums[k] = nums[i];
            k++;
        }
    }
    
    for (int j = 0; j < zeroCount; j ++) {
        nums[k] = 0;
        k++;
    } 
}

//2.交换
void moveZeroes(int* nums, int numsSize) {
    int i,j;
    
    for (i = 0, j = 0;i < numsSize;i++) {
        if(nums[i]) {
            int temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
            j++;
        }
    }
}
