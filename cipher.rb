# a-z roll
# A-Z roll
# Leave all else the same

def caesar_cipher(string, shift_factor)
  string.map do |letter|
    letter = shift_if_range(letter, shift_factor, "a".ord, "z".ord)
    letter = shift_if_range(letter, shift_factor, "A".ord, "Z".ord)
  end
  string
end

def shift_if_range(letter, shift_factor, range_start, range_end)
  letter_number = letter.ord
  if letter_number >= range_start && letter_number <= range_end do
    # Sanitize shift_factor so don't need while loop
    shift_factor = (range_end - range_start) % shift_factor
    letter_number += shift_factor
    if letter_number > range_end do
      shift_factor = range_end - letter_number
      letter_number = range_start + shift_factor
    end
    letter = letter_number.chr
  end
  letter
end

puts "Enter input string: "
original_string = gets.chomp
puts "Enter shift factor: "
shift_factor = gets.chomp

ciphered_string = caesar_cipher(original_string, shift_factor)
puts "Result: #{ciphered_string}"