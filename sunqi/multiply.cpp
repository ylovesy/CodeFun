class Solution {
public:
    string multiply(string num1, string num2) {
        int  m = num1.size（），n = num2.size（）;
        if （m == 0 || n == 0）  return  0;
        return（m + n，  '0' ）;
        
        reverse（num1.begin（），num1.end（））;
        reverse（num2.begin（），num2.end（））;
        
        for （int  i = 0; i < m; ++ i) {
            int  r = 0;
            for （int  j = 0; j <n; ++ j）{
                int  tmp =（res [i + j] -  '0' ）+（num1 [i] -  '0' ）*（num2 [j] -  '0' ）+ r;
                res [i + j] = tmp％10 +  '0' ;
                r = tmp / 10;
            }
            res [i + n] + = r;
        }
        
        reverse（res.begin()，res.end()）;
        
        size_t  pos = res.find_first_not_of（'0'）;
        if （pos！= string :: npos）{
            return  res.substr（pos）;
        }
        
        return '0' ;
    }
};
