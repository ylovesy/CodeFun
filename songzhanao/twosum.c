int* twoSum(int* nums, int numsSize, int target) {
    int *ret = (int*)malloc(2*sizeof(int));
    for (int i = 0;i < numsSize;i++){
        for(int j = i+1;j<numsSize;j++){
            if(nums[j] == target - nums[i]){
                ret[0] = i;
                ret[1] = j;
                return ret;
            }
        }
    }
    return NULL;
}


