# You are given an n x n 2D matrix representing an image.

# Rotate the image by 90 degrees (clockwise).

# Follow up:
# Could you do this in-place?

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
    matrix.reverse!
    matrix.each_with_index do |line,i|
        line.each_with_index do |num,j|
            if i > j
                tem = matrix[j][i]
                matrix[j][i] = matrix[i][j]
                matrix[i][j] = tem
            end
        end
    end

    # matrix
end

matrix =  [[1,2],[3,4]]

rotate(matrix)
puts matrix;