def substrings (sentence, dictionary)
  all_substrings = Hash.new(0)
  sentence.each do |word|
    if dictionary.include? word
      all_substrings[word] = all_substrings[word] + 1
    end
  end
  all_substrings
end

puts "Enter word/sentence: "
user_sentence = gets.chomp.scan(/[\w']+/)

puts "Enter dictionary words (separated with commas): "
user_dictionary = gets.chomp.split(",")

all_substrings = substrings(user_sentence, user_dictionary)
puts "Substrings: { "
all_substrings.each do |key, value|
  puts "#{key}=>#{value} "
end
puts "}"


# Learned scan