# Hangman
#
# git remote add origin git@github.com:ArkWist/hangman.git
# git push -u origin master
#
# Player can save game anytime
# Option to load a previous game
#
# ------------------------------


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

def save(right, wrong, mercy, answer)
  filename = get_filename
  File.open(filename, "w") do |file|
    file.puts "right=#{right}"
    file.puts "wrong=#{wrong}"
    file.puts "mercy=#{mercy}"
    file.puts "answer=#{answer}"
  end
  puts "#{filename} saved."
end

def get_filename
  print "Input filename: "
  filename = gets.chomp.downcase + ".sav"
end

def save_var(line)
  line.split("=").at(0)
end

def sav_value(line)
  line.split("=").at(1)
end


### Program Start ###

answer = random_word
right = ["_"] * answer.length
wrong = []
mercy = 9

print "Load save game? (y/n): "
if gets.chomp.downcase == "y"
  filename = get_filename
  if File.exist?(filename)
    File.readlines(filename) do |line|
      case save_var(line)
      when right
        right = save_value(line)
      when wrong
        wrong = save_value(line)
      when mercy
        mercy = save_value(line)
      when answer
        answer = save_value(line)
      end
    end
    puts "#{filename} loaded."
  else
  puts "#{filename} does not exist."
end
    
until mercy < 0 || !solved.include?("_")
  display_board(right, wrong, mercy)
  print "Input guess: "
  guess = gets.chomp.to_s.downcase

  next if guess.length != 1 && guess != "save"
  next if right.each.downcase.include?(guess)
  next if wrong.include?(guess)

  if guess == "save"
    save(right, wrong, mercy, answer)
  elsif answer.downcase.to_a.include?(guess)
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
