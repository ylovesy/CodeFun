# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
    if !root then
        return true
    else
        return depth(root)!= -1
    end
end

def depth(root)
    if !root then
        return 0
    else
        left = depth(root.left)
        right = depth(root.right)
        if left == -1||right == -1||left -right >1||right-left>1 then
            return -1
        elsif left - right > 0 then
            return left + 1
        else
            return right + 1
        end

    end
end
