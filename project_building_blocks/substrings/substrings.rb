

def substrings (sentence, dictionary)
  all_substrings = Hash.new(0)
  sentence.each do |word|
    all_substrings[word] = all_substrings[word] + 1 if dictionary.include? word
  end
  all_substrings
end

def print_substrings(all_substrings)
  string = "Substrings: {"
  needs_comma = false
  all_substrings.each do |key, value|
    if needs_comma then string += ", " end
    string += "\"#{key}\"=>#{value}"
    needs_comma = true
  end
  string += "}"
  puts string
end

print "Enter word/sentence: "
user_sentence = gets.chomp.downcase.scan(/[\w']+/)

print "Enter dictionary words (separated with commas): "
user_dictionary = gets.chomp.delete(" ").split(",")

all_substrings = substrings(user_sentence, user_dictionary)

print_substrings(all_substrings)

