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
    node.color = false
    value < parent.value ? parent.child1 = node : parent.child2 = node

    rebalance(node)

    end

  end

# Red-Black Tree Visualization:
# https://www.cs.usfca.edu/~galles/visualization/RedBlack.html
# https://en.wikipedia.org/wiki/Tree_rotation

# RECOLOR when red node's parent's sibling is red
# RESTRUCTURE when red node's parent's sibling is black or null
#   RIGHT when added to left
#   RIGHT-LEFT when added to right on left side
#   LEFT when added to right
#   LEFT-RIGHT when added to left on right side
# Right: swap parent with left child
# Left: swap parent with right child
#   is parent right child
#   current left child becomes parent
#   parent right child becomes current left child
# If N's parent is black, do nothing
# If N's parent is red
#   If N's parent's sibling is black
#     If N is left child >> rotate right
#     If N is right child >> N becomes grandparent
#     Opposites for opposite side of G I guess.




=begin
Insert X
while X != root && P.color == red
  if P == P.P.left
    Y = P.P.right  #uncle
    if Y.color = red
      then case1
    elsif X == P.right
      then case2
      case3
    else (case1 with L and R swapped?)
root.color = black

Page 24:
http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-046j-introduction-to-algorithms-sma-5503-fall-2005/video-lectures/lecture-10-red-black-trees-rotations-insertions-deletions/lec10.pdf

=end



=begin
http://pages.cs.wisc.edu/~paton/readings/Red-Black-Trees/

if P == red
  if U == black
    if P == G.left
      if N == P.left
        >> G.left = P.right
        >> P.parent = G.parent  #Were G root, P now root
        >> G.parent = P
        >> P.right = G
      if N == P.right
        >> P.right = null
        >> P.parent = N   #Were G root, N now root
        >> K.left = P
        >> K.right = G
        >> G.parent = N
    if P == G.right
        #Mirror


=end
  def rebalance(node)
    # Needs to determine R, L, RL, LR, and recolor
    while node.color == false && !node.parent.nil? && node.parent.color == false
      unless node.parent.parent.nil?
        node.parent.color = true
        node = parent
      end
    end

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

