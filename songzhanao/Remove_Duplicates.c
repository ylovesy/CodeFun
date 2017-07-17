int removeDuplicates(int* nums, int numsSize) {
    int length = numsSize;
    int i,equalNum=0;
    for(i= 0;i<numsSize-1;i++)
    {
        if(nums[i]==nums[i+1])
        {
            equalNum++;
            length--;
        }
        else
        {
            nums[i+1-equalNum]=nums[i+1];
        }
    }
    return length;
}


