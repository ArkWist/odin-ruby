class Node
  attr_accessor :value, :parent, :child1, :child2

  def initialize(value, parent, color=true) #true = black
    @value = value
    @parent = parent
    @color = color
    @child1 = nil
    @child2 = nil
  end
end

class BST
  attr_accessor :root

  def initialize(data)
    @root = build_tree(data)
  end
end




def build_tree(data, parent=nil)
  middle = data.length/2
  node = Node.new(data[middle], parent)
  node.child1 = build_tree(data[0...middle], node) if data.length > 1
  node.child2 = build_tree(data[middle..-1], node) if data.length > 2
  return node
end

def build_rb_tree(data, parent=nil) #[3,4,23,8,6345,7,9,1,324,7,4,5,67,9]
  # Add nodes in order.
  # If smaller than head, left child
  # If larger than head, right child
  # If tree unbalanced, balance tree somehow
  #node = Node.new(data[0], parent)
  #node.child1 = build_rb_tree(data[1])
  head = Node.new(data.shift)
  data.each do |value|
    add_node(head, value)
  end
end




def breadth_first_search
  # Returns node with given value
  # Use queue array to keep track of child nodes
end

def depth_first_search
  # Use stack array
end

def dfs_rec
  # depth first search that is recursive
end
