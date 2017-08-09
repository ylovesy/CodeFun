import Foundation

/*
 48. Rotate Image
 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 
 Follow up:
 Could you do this in-place?
 */
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0 ..< matrix.count {
            for j in i ..< matrix.count {
                let temp = matrix[i][j];
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
        
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix.count / 2 {
                let temp = matrix[i][j];
                matrix[i][j] = matrix[i][matrix.count - 1 - j]
                matrix[i][matrix.count - 1 - j] = temp
            }
        }
    }
}
