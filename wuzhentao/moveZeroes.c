
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

//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
//
//Note:
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.
//Credits:
//Special thanks to @jianchao.li.fighter for adding this problem and creating all test cases.
