def bubble_sort (unsorted_array)
  
  sorted = false

  while !sorted
    sorted = true
    unsorted_array[0...-1].map.with_index do |value, index|

      if value < unsorted_array[index + 1]
        temp = unsorted_array[index + 1]
        unsorted_array[index + 1] = value
        value = temp
        sorted = false
      end

    end
  end
end

# print "Enter array to sort: "
# unsorted_array = gets.chomp

unsorted_array = [1,3,2,5,6,4]
puts unsorted_array
puts bubble_sort(unsorted_array)