int* findDisappearedNumbers(int* nums, int numsSize, int* returnSize) {  
    int *a;  
    a=(int*)malloc((numsSize+1)*sizeof(int));  
    int i=0;  
    for(i=0;i<numsSize;i++){  
        a[i]=0;  
    }  
    for(i=0;i<numsSize;i++){  
        a[nums[i]]=1;  
    }  
    a[0]=1;  
    for(i=1;i<=numsSize;i++){  
        if(a[i]!=1){  
            a[a[0]]=i;  
            a[0]++;  
        }  
    }  
    *returnSize=a[0]-1;  
    return &a[1];  
}  
