class TreeNode
    attr_accessor :val, :left, :right, :next
    def initialize(val)
        @val = val
        @left, @right, @next = nil, nil, nil
    end
end

def connect(root)
    list = Array.new
    list.push(root)

    while list.count > 0 do
        temp = Array.new
        list.each_with_index do |node,idx|
            temp.push(node.left)
            temp.push(node.right)

            if list.count > idx + 1 then
                node.next = list[idx + 1]
            end
        end
        list = temp
    end
end