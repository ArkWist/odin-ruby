def substrings (sentence, dictionary)
  all_substrings = Hash.new(0)
  sentence.each do |word|
    if dictionary.include? word
      all_substrings[word] = all_substrings[word] + 1
    end
  end
  all_substrings
end

print "Enter word/sentence: "
user_sentence = gets.chomp.downcase.scan(/[\w']+/)

print "Enter dictionary words (separated with commas): "
user_dictionary = gets.chomp.delete(" ").split(",")

all_substrings = substrings(user_sentence, user_dictionary)
print_string = "Substrings: {"
needs_comma = false
all_substrings.each do |key, value|
  if needs_comma
    print_string += ", "
  end
  needs_comma = true
  print_string += "\"#{key}\"=>#{value}"
end
print_string += "}"
puts print_string

