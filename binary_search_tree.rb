class Node
  attr_accessor :value, :parent, :child1, :child2

  def initialize(value, parent=nil, black=true)
    @value = value
    @parent = parent
    @black = black
    @child1 = nil
    @child2 = nil
  end

  def has_child?
    return !child1.nil? || !child.nil?
  end

  def black?
    return @black
  end

  def set_black
    @black = true
  end

  def set_red
    @black = false
  end
end

class RBT
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
    node.set_red
    value < parent.value ? parent.child1 = node : parent.child2 = node
    rebalance(node)
    @head = find_head(node)
  end

  def rebalance(N)
    case_1(N)
  end

  def case_1(N)
    P = N.parent
    if P == null then N.set_black else case_2(N, P) end
  end

  def case_2(N, P)
    if !P.black? then case_3(N, P) end
  end

  def case_3(N, P)
    G = P.parent
    if P == G.left then U = G.right else U = G.left end
    if U == null || U.black?
      case_4(N, P, G)
    else
      P.set_black
      U.set_black
      G.set_red
      case_1(G)
    end
  end

  def case_4(N, P, G)
    if N == P.right && P == G.left
      rotate_left(N, P, G)
      P = N
      N = N.left
    elsif N == P.left && P == G.left
      rotate_right(N, P, G)
      P = N
      N = N.right
    end
    case_5(N, P, G)
  end

  def case_5(N, P, G)
    P.set_black
    G.set_red
    if N == P.left
      rotate_right(N, P, G)
    else
      rotate_left(N, P, G)
    end
  end

  def rotate_left(N, P, G)
    P.right = N.left
    P.parent = N
    N.left = P
    N.parent = G
    G.left = N
  end

  def rotate_right(N, P, G)
    P.left = N.right
    P.parent = N
    N.right = P
    N.parent = G
    G.right = N    
  end

  def find_head(N)
    if N.parent != null then find_head(N.parent) else return N end
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
  tree = RBT.new(head)
  data.each do |value|
    tree.add_node(value)
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


sorted_data = [1, 3, 4, 4, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
tree = build_tree(sorted_data)

unsorted_data = [3, 4, 23, 8, 6345, 7, 9, 1, 324, 7, 4, 5, 67, 9]
rbtree = build_rb_tree(unsorted_data)





