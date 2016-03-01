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

  #my_select
  #my_all?      ; does everything satisfy the block condition?
  #my_any?      ; does anything satisfy the block condition?
  #my_none?
  #my_count
  #my_map
  #my_inject
  
end

  #multiply_els

  
