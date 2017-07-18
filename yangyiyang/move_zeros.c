 void moveZeroes(int* nums, int numsSize) {
     int nonzeroesCount = 0;
     for(int i = 0; i < numsSize; i++)
     {
             if(nums[i] != 0) nonzeroesCount++;
         }
     for(int i,j = 0; i < numsSize; i++)
     {
             if(nums[i] == 0 )
             {
                         continue;
                     }else {
                                 if(j < numsSize)
                                 {
                                                 nums[j++] = nums[i];
                                             }
                             }
         }
     for(int i = numsSize - 1, j = numsSize - nonzeroesCount; j > 0; j--)
     {
             nums[i] = 0;
             i--;
         }
 }
