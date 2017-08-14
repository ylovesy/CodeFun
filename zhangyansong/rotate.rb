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


def rotate(img)
 len = img.length - 1
      num_rotate = (len / 2)
      runner = img.length  - 2
      (0..num_rotate).each do |r|
        (0..runner).each do |i|
          fouth   = img[len - i - r][r]
          first   = img[r][i + r]
          img[r][i + r] = fouth
          second  = img[i + r][len - r]
          img[i + r][len - r] = first
          third   = img[len - r][len - i - r]
          img[len -  r][len - i - r] = second
          img[len - i - r ][ r] = third
        end
        runner  = runner - 2
      end
      img
end