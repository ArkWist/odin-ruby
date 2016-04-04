Hangman

git remote add origin git@github.com:ArkWist/hangman.git
git push -u origin master

Player can save game anytime
Option to load a previous game

------------------------------


def random_word
  dictionary = File.read("5desk.txt").readlines
  randominator = Random.new
  line = randominator.rand(dictionary.length)

  until dictionary[line].length.between?(5, 12)
    dictionary.delete_at[line]
    line = randominator.rand(dictionary.length)
  end

  word = dictionary[line]
end

def display_board(right, wrong, mercy)
  padding = " " * 4
  puts
  puts "#{padding}#{right.join(" ")}"
  puts
  puts "#{padding}Wrong: #{wrong.join(", ")}"
  puts "#{padding}#{mercy} wrong guesses left."
  puts
end

answer = random_word
right = ["_"] * answer.length
wrong = []
mercy = 9

until mercy < 0 || !solved.include?("_")
  display_board(right, wrong, misses)
  print "Input guess: "
  guess = gets.chomp.to_s.downcase

  next if guess.length != 1
  next if right.each.downcase.include?(guess)
  next if wrong.include?(guess)

  if answer.downcase.to_a.include?(guess)
    answer.each_with_index do |letter, index|
      right[index] = answer[index] if guess == letter.downcase
    end
  else
    mercy -= mercy
    wrong.push(guess)
  end
end

puts
if mercy < 0
  puts "You lose!"
  puts
  puts "The answer was: #{answer}"
else
  puts "Congratulations!"
  puts
  puts "You are victorious!"
end
puts
