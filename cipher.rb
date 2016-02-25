# a-z roll
# A-Z roll
# Leave all else the same

def caesar_cipher(original_string, shift_factor)
  original_string.map do |char|
    char = shift_if_range(char, shift_factor, 65, 90)
    char = shift_if_range(char, shift_factor, 97, 122)
  end
  return original_string
end

puts "Enter input string: "
original_string = gets.chomp
puts "Enter shift factor: "
shift_factor = gets.chomp

ciphered_string = caesar_cipher(original_string, shift_factor)
puts "Result: #{ciphered_string}"