//
//  RotateImage.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/10.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <vector>

using namespace std;

class RotateImageSolution {
public:void rotate(vector<vector<int>>& matrix) {
    if(matrix.size() ==0 || matrix[0].size() == 0)
        return;
    int layerNum = matrix.size() * 0.5;
    for(int layer=0;layer<layerNum;layer++)
    {
        for(int i=layer;i<matrix.size() - layer - 1;i++)
        {
            int temp = matrix[layer][i];
            matrix[layer][i] = matrix[matrix.size() - 1 - i][layer];
            matrix[matrix.size() - 1 - i][layer] = matrix[matrix.size() - 1 - layer][matrix.size() - 1 - i];
            matrix[matrix.size() - 1 - layer][matrix.size() - 1 - i] = matrix[i][matrix.size() - 1 - layer];
            matrix[i][matrix.size() - 1 - layer] = temp;
        }
    }
}
};
