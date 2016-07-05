class LinkedList

  def initialize
    @head = nil
  end
    
  def append(value)
    node = Node.new(value)
    if head then tail.next_node = node else @head = node end
  end

  def prepend(value)
    node = Node.new(value)
    if head then node.next_node = head end
    @head = node
  end

  def size
    size, node = 0, @head
    until node.nil? do node = node.next_node; size += 1 end
    size
  end
  
  def head
    @head
  end
  
  def tail
    node = head
    unless node.nil? then node = node.next_node until node.next_node.nil? end
    node
  end
  
  def at(index)
    node = @head
    until index <= 0 do node = node.next_node unless node.nil?; index -= 1 end
    value = if node && index == 0 then node.value else nil end
  end
  
  def pop
    new_tail = head
    old_tail = head.next_node if new_tail
    if old_tail then new_tail, old_tail = old_tail, old_tail.next_node until old_tail.next_node.nil? end
    if new_tail then new_tail.next_node = nil end
    old_tail
  end
  
  def contains?(value)
    node, contains = head, false
    until contains || node.nil? do contains = node.value == value; node = node.next_node end
    contains
  end
  
  def find(value)
    node, i, index = head, 0, nil
    until index || node.nil?
      if node.value == value then index = i else i += 1; node = node.next_node end
    end
    index
  end

  def to_s
    node, string = head, ""
    if node then until node.nil?
      string += "( #{node.value} ) -> "
      string += "nil" if node.next_node.nil?
      node = node.next_node end
    else string = "nil" end
    string
  end
  
  # Doesn't tell you if it fails.
  def insert_at(value, index) # Insert at 0 doesn't work
    if index == 0 then @head = Node.new(value, head)
    else index -= 1; new_tail, new_head = head, head ? head.next_node : nil
      until new_tail.nil? || index <= 0
        new_tail = new_tail.next_node
        new_head = new_head.next_node unless new_head.nil?
        index -= 1
      end
      if index == 0 then node = Node.new(value, new_head); new_tail.next_node = node if new_tail end
    end
  end
  
  # Doesn't tell you if it fails.
  def remove_at(index)
    if index == 0 then @head = head.next_node unless head.nil?
    else index -= 1; new_tail, new_head = head, head.next_node ? head.next_node.next_node : nil
      until new_head.nil? || index <= 0
        new_tail = new_tail.next_node unless new_tail.nil?
        new_head = new_head.next_node
        index -= 1
      end
      if index == 0 then new_tail.next_node = new_head end
    end
  end
  
end


class Node
  attr_reader :value, :next_node
  attr_writer :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

