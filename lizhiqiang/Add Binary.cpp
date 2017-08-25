
//add Binary  
class Solution {  
public:  
    string addBinary(string a, string b) {  
        // Start typing your C/C++ solution below  
        // DO NOT write int main() function  
            string c;  
            int flag=0;  
            int lena = a.size();  
            int lenb = b.size();  
            int len = abs(lena-lenb);  
            string append(len,'0');  
            if(lena>lenb){  
                b = append + b;  
                c.resize(lena,'0');  
            }else{  
                a = append + a;  
                c.resize(lenb,'0');  
            }  
            for(int j=c.size()-1;j>=0;j--){  
                int current = (a[j]-'0') ^(b[j]-'0') ^flag;  
                if((a[j]-'0') +(b[j]-'0') +flag >1)  
                    flag = 1;  
                else   
                    flag = 0;  
                c[j] = current+'0';  
            }  
            if(flag == 1)  
                c = '1'+ c;  
              
            return c;  
              
    }  
};  


class Solution {
public:
    string addBinary(string a, string b) {
        string result;
        int lenA = a.size();
        int lenB = b.size();
        if (lenA == 0 || lenB == 0) {
            return lenA == 0 ? b : a;
        }
        int posA = --lenA;
        int posB = --lenB;
        int flag = 0;
        while (posA >= 0 && posB >= 0) {
            if (a[posA] == '1' && b[posB] == '1') {
                if (flag) {
                    result.push_back('1');
                } else {
                    result.push_back('0');
                    flag = 1;
                }
            } else if (a[posA] == '1' || b[posB] == '1') {
                if (flag) {
                    result.push_back('0');
                } else {
                    result.push_back('1');
                }
            } else {
                if (flag) {
                    result.push_back('1');
                    flag = 0;
                } else {
                    result.push_back('0');
                }
            }
            posA--;posB--;
        }
            while (posA >= 0) {
                if (a[posA] == '1' && flag == 1) {
                    result.push_back('0');
                } else if (a[posA] == '0' && flag == 1) {
                    result.push_back('1');
                    flag = 0;
                } else {
                    result.push_back(a[posA]);
                }
                posA--;
            }
            while (posB >= 0) {
                if (b[posB] == '1' && flag == 1) {
                    result.push_back('0');
                } else if (b[posB] == '0' && flag == 1) {
                    result.push_back('1');
                    flag = 0;
                } else {
                    result.push_back(b[posB]);
                }
                posB--;
            }
        if (flag) {
            result.push_back('1');
        }
        reverse(result.begin(), result.end());
        return result;
    }
};
