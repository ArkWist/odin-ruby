def bubble_sort (array)
  sorted = false
  while !sorted
    sorted = true
    index = 0
    until index == array.length - 1
      if array[index] > array[index+1]
        sorted = false
        array[index], array[index + 1] = array[index + 1], array[index]
      end
      index += 1
    end
  end
  array
end

def bubble_sort_by (array)
  sorted = false
  while !sorted
    sorted = true
    index = 0
    while index < array.length - 1
      if yield(array[index], array[index+1]) > 0
        sorted = false
        array[index], array[index + 1] = array[index + 1], array[index]
      end
      index += 1
    end
  end
  array
end


=begin
unsorted_array = [1,3,2,5,6,4]
print bubble_sort(unsorted_array).inspect

sorted_array = bubble_sort_by(["hi","hello","hey"]) { |left,right|
  left.length - right.length }
print sorted_array.inspect
=end

