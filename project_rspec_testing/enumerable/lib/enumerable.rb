module Enumerable

  def my_each
    for element in self
      yield(element)
    end
  end
  
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += index
    end
  end
  
  def my_select
    selected = []
    my_each{ |element| selected << element if yield(element) }
    selected
  end
  
  def my_all?
    my_each{ |element| return false unless yield(element) }
    true
  end
  
  def my_any?
    my_each{ |element| return true if yield(element) }
    false
  end
  
  def my_none?
    my_each{ |element| return false unless !yield(element) }
    true
  end
  
  def my_count
    count = 0
    my_each_with_index{ |element| count += 1 if yield(element) }
    count
  end

# Original my_map method that only takes a block.
  #def my_map
  #  mapped = []
  #  my_each{ |element| mapped << yield(element) }
  #  mapped
  #end
  
# Second my_map method that takes only a proc.
  #def my_map(proc)
  #  mapped = []
  #  my_each{ |element| mapped << proc.call(element) }
  #  mapped
  #end
  
# New my_map method that takes a proc, a block, or both.
# However, only executes the block when supplied with a proc.
#   In this case, both the block and proc are executed.
# This is meant to do nothing if only a block is supplied.
  def my_map(proc = nil)
    mapped = []
    if proc && !block_given?
      my_each{ |element| mapped << proc.call(element) }
    elsif proc && block_given?
      my_each{ |element| mapped << proc.call(yield(element)) }
    end
    mapped  
  end


  #def my_inject (injected)
                # ; accumulates everything with what it's given
                # ; but this doesn't match what ToP is asking
                # ; so I think this takes a default value
                # ; then that can be used in the block passed to inject
                # ; which could be any operation
  #  my_each { |element| injected = yield(injected, element) }
  #  injected
  #end
  
  
  def my_inject(memo = self[0])
    my_each{ |element| memo = yield(memo, element) }
    memo
  end
  
  
end

def multiply_els(array)
  array.my_inject(1) { |result, element| result * element }
end
