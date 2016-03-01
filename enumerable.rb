module Enumerable

  def my_each   # ; do the given block for everything in the array 
    for element in self
      yield(element)
    end
  end
  
  def my_each_with_index  # Can I make this piggyback off my_each?
    index = 0
    for element in self
      yield(element,index)
      index += index
    end
  end
  
  def my_select
    selected = []
    my_each { |element| selected << element if yield(element) }
    selected
  end
  
  def my_all?
    my_each { |element| return false unless yield(element) }
    true
  end
  
  def my_any?
    my_each { |element| return true if yield(element) }
    false
  end
  
  def my_none?
    my_each { |element| return false unless !yield(element) }
    true
  end
  
  def my_count
    count = 0
    my_each_with_index { |element| count += 1 if yield(element) }
    count
  end

  def my_map
    mapped = []
    each { |element| mapped << yield(element) }
    mapped
  end

  def my_inject (injected)
                # ; accumulates everything with what it's given
                # ; but this doesn't match what ToP is asking
                # ; so I think this takes a default value
                # ; then that can be used in the block passed to inject
                # ; which could be any operation
    my_each { |element| injected = yield(injected, element) }
    injected
  end
  
end

def multiply_els (array)
  array.my_inject(1) { |result, element| result * element}
end


array = [1, 3, 2, 6, 2, 5, 4, 5]
print multiply_els(array)

