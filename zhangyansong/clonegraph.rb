
def cloneGraph(node)
    if !node then
        return node
    end

    map = Hash.new()
    return clone(node,map)
end

def clone(node,map)
    Node copy = Node.new()
    map[node.label] = copy
    for i in 0..node.neighbors.size {
        copy.neighbors.push(node.neighbors[i],map)
    }
    return copy
end


