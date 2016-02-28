def bubble_sort (array)
  
  sorted = false

  while !sorted
    sorted = true

    index = 0
    while index < array.length - 1
    
      if array[index] > array[index+1]
        temp = array[index]
        array[index] = array [index+1]
        array[index+1] = temp
        sorted = false
      end
      
      index += 1
      
    end
  end
  return array
end

# print "Enter array to sort: "
# unsorted_array = gets.chomp

unsorted_array = [1,3,2,5,6,4]
print bubble_sort(unsorted_array).inspect

