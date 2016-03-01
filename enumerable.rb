module Enumerable

  def my_each   # ; do the given block for everything in the array 
    for element in self
      yield(element)
    end
  end
  
  def my_each_with_index
    index = 0
    for element in self
      yield(element,index)
      index += index
    end
  end
  
=begin # Alternative from Jberczel for reference if mine doesn't work
  def my_each_with_index
    for i in 0...length
      yield(self[i], i)
    end
  end
=end

  def my_select
    selected = []
    for element in self
      if yield(element)
        selected << element
      end
    end
    selected
  end

  def my_all? # return false unless all true
    for element in self
      if !yield(element)
        return false
      end
    end
    true
  end
  
  def my_any? # return true if at least 1 true
    for element in self
      if yield(element)
        return true
      end
    end
    false
  end
  
  def my_none? # return false unless all false
    for element in self
      if yield(element)
        return false
      end
    end
    true
  end

  def my_count
    count = 0
    for element in self
      count += 1
    end
    count
  end
  
  #my_count
  #my_map
  #my_inject
  
end

  #multiply_els

  
