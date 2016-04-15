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

def build_tree(data, parent=nil)
  middle = data.length/2
  node = Node.new(data[middle], parent)
  node.child1 = build_tree(data[0...middle], node) if data.length > 1
  node.child2 = build_tree(data[middle..-1], node) if data.length > 2
  return node
end
