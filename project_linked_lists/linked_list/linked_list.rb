

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
    node = @head
    unless node.nil? then node = node.next_node until node.next_node.nil? end
    node
  end
  
  def at(index)
    node = @head
    until index == 0 do node = node.next_node unless node.nil?; index -= 1 end
    value = if node then node.value else node end
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
  
  def insert_at(value, index) # Currently puts this `index` past head and deletes remainder
    node, i, broken_tail, broken_head = head, 0, nil, nil
    
    
    
    
    
    until broken_tail || node.nil? do broken_tail = node if i == index; i += 1; node = node.next_node end
    node = Node.new(value, broken_head)
    unless broken_tail.nil? then broken_tail.next_node = node end
  end
  
  def remove_at(index) # remove node at given index
    node = at(index)
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


list = LinkedList.new
list.append("abc")
list.prepend("def")
list.append("ghi")
puts "list.head.value: #{list.head.value}"
puts "list.tail.value: #{list.tail.value}"
puts "list.size: #{list.size}"
puts "list.at(2): #{list.at(2)}"
puts "list.pop.value: #{list.pop.value}"
puts "list.size: #{list.size}"
puts "list.contains?(\"abc\"): #{list.contains?("abc")}"
puts "list.contains?(\"abc\"): #{list.contains?("ab")}"
puts "list.find(\"def\"): #{list.find("def")}"
puts "list.find(\"abc\"): #{list.find("abc")}"
puts "list.to_s: #{list.to_s}"
list2 = LinkedList.new
puts "list2.to_s: #{list2.to_s}"
list.append("jkl")
puts "list.to_s: #{list.to_s}"
list.insert_at("mno", 1)
puts "list.to_s: #{list.to_s}"


