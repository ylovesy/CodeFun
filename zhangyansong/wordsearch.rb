# Given a 2D board and a word, find if the word exists in the grid.

# The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

# For example,
# Given board =

# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]
# word = "ABCCED", -> returns true,
# word = "SEE", -> returns true,
# word = "ABCB", -> returns false.


# @param {Character[][]} board
# @param {String} word
# @return {Boolean}

def exist(board, word)
    if board.length == 0 return false
    board.each_with_index do |array,indexi|
        board[0].each_with_index do |array1,indexj|
            isExisted = search(board, i, j, word, 0)
            if isExisted
                return true
            end
        end
    end
    return false
end

def search(board,i,j,word,idx)
    if idx >= word.length
        return true
    end
    if i<0 || i>board.length||j<0||j>=board[0].length||board[i][j] != word.chars[idx]
        return false
    end
    board[i][j] = -1
    res = search(board, i-1, j, word, idx+1) || search(board, i+1, j, word, idx+1) || search(board, i, j-1, word, idx+1) || search(board, i, j+1, word, idx+1)
    board[i][j] = -1
    return res
end

