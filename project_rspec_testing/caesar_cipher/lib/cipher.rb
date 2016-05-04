
def caesar_cipher(text, shift)
  code = text.each_char.map do |letter|
    letter = encode(letter, shift)
  end
  code.join
end

def encode(letter, shift)
  if letter.between?("a", "z")
    letter = shift_in_range(letter, shift, "a", "z")
  elsif letter.between?("A", "Z")
    letter = bounded_shift(letter, shift, "A", "Z")
  end
  letter
end

def bounded_shift(letter, shift, range_a, range_z)
  shift = shift % (range_z.ord - range_a.ord)
  # ^ Handle shifts greater than the given range.
  letter = (letter.ord + shift).chr
  if letter.ord > range_z.ord
    shift = letter.ord - range_z.ord
    letter = (range_a.ord + shift).chr
  end
  letter
end



# Ask for input only when run independently (not through Rspec).
if __FILE__ == $0
  print "Enter input string: "
  original_string = gets.chomp
  print "Enter shift factor: "
  shift_factor = gets.chomp
  puts "Result: #{caesar_cipher(original_string, shift_factor)}"
end