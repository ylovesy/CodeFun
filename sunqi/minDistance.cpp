class Solution {
public:
    int minDistance(string word1, string word2) {
        int rows = word1.size() + 1;
        int cols = word2.size() + 1;
        int ** d = (int**)malloc(rows * sizeof(int*));
        for(int i = 0; i < rows; ++i){
            d[i] = (int*)malloc(cols * sizeof(int));
            d[i][0] = i;
        }
        for(int j = 0; j < cols; ++j)
            d[0][j] = j;
        for(int i = 1; i < rows; ++i) {
            char ci = word1[i-1];
            for(int j = 1; j < cols; ++j) {
                char cj = word2[j-1];
                if (ci == cj) {
                    d[i][j] = d[i-1][j-1];
                } else {
                    int dEdit = d[i-1][j-1] + 1;
                    int dAdd = d[i][j-1] + 1;
                    int dDel = d[i-1][j] + 1;
                    int min = dEdit < dAdd ? dEdit : dAdd;
                    min = min < dDel ? min : dDel;
                    d[i][j] = min;
                }
            }
        }
        int result = d[rows - 1][cols - 1];
        return result;
    }
};
