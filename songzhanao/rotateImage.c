void rotate(int** matrix, int matrixRowSize, int matrixColSize) {
    int temp;
    for(int i = 0; i < matrixRowSize; i++){
        for(int j = i+1; j < matrixColSize; j++){
            temp = matrix[i][j];
            matrix[i][j] = matrix[j][i];
            matrix[j][i] = temp;
        }
    }
        
    for(int i = 0; i < matrixRowSize; i++){
        for(int j = 0; j < matrixColSize/2; j++){
            temp = matrix[i][j];
            matrix[i][j] = matrix[i][matrixColSize-1-j];
            matrix[i][matrixColSize-1-j] = temp;
        }
    }
}

