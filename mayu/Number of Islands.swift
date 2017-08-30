import Foundation

/*
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Example 1:
 
 11110
 11010
 11000
 00000
 Answer: 1
 
 Example 2:
 
 11000
 11000
 00100
 00011
 Answer: 3
 */
private class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        var g = grid
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if g[i][j] == "1" {
                    count += 1
                    dfs(&g, m: i, n: j)
                }
            }
        }
        return count
    }
    
    func dfs(_ grid: inout [[Character]], m: Int, n: Int) {
        if m < 0 || m >= grid.count || n < 0 || n >= grid[0].count || grid[m][n] != "1" {
            return
        } else {
            grid[m][n] = "*"
            dfs(&grid, m: m - 1, n: n)
            dfs(&grid, m: m + 1, n: n)
            dfs(&grid, m: m, n: n + 1)
            dfs(&grid, m: m, n: n - 1)
        }
    }
}
