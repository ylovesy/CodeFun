// Forward declaration of isBadVersion API.
bool isBadVersion(int version);

class Solution {
public:
    int firstBadVersion(int n) {    
        if(n <= 0)  return 0;  
        int low = 1;  
        int high = n;  
        int mid;  
        bool value;  
        while(low <= high) {  
            mid = low+(high-low)/2;  
            value = isBadVersion(mid);  
            if(value) {     /*为真发现错误版本*/  
             high = mid - 1;  
            } else {  
                low = mid + 1;  
            }          
        }  
    return low;   
    }
};
