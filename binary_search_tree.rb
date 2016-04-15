class Node
  attr_accessor :value, :parent, :child1, :child2
  def initialize(value, parent=nil, color=true) #true = black
    @value = value
    @parent = parent
    @color = color
    @child1 = nil
    @child2 = nil
  end
  def has_child?
    return !child1.nil? || !child.nil?
  end
end

class RBTree
  attr_accessor :head
  def initialize(head)
    @head = head
  end

  def add_node(value)
    parent = @head
    node = Node.new(value)
    while parent.has_child?
      if value < parent.value && !parent.child1.nil?
        parent = parent.child1
      elsif value >= parent.value && !parent.child2.nil?
        parent = parent.child2
      else
        break
      end
    end
    node.parent = parent
    node.color = false
    value < parent.value ? parent.child1 = node : parent.child2 = node
  end

  def rebalance
    # Needs to deermine R, L, RL, LR, and recoler
  end

end



def build_tree(data, parent=nil)
  middle = data.length/2
  node = Node.new(data[middle], parent)
  node.child1 = build_tree(data[0...middle], node) if data.length > 1
  node.child2 = build_tree(data[middle..-1], node) if data.length > 2
  return node
end


def build_rb_tree(data) #[3,4,23,8,6345,7,9,1,324,7,4,5,67,9]
  head = Node.new(data.shift)
  tree = RBTree.new(head)

  data.each do |value|
    tree.add_node(value)
    tree.rebalance
  end
  
  # Add nodes in order.
  # If smaller than head, left child
  # If larger than head, right child
  # If tree unbalanced, balance tree somehow
  #node = Node.new(data[0], parent)
  #node.child1 = build_rb_tree(data[1])
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


sorted_data = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
tree = build_tree(sorted_data)

unsorted_data = [3, 4, 23, 8, 6345, 7, 9, 1, 324, 7, 4, 5, 67, 9]
rbtree = build_rb_tree(unsorted_data)

