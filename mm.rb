# Defaults ############
  colors = 6
  guesses = 10
  print_width = 45
  skip_questions = true
#######################



colors = (((1 + 64).chr)..((colors + 64).chr)).to_a

separator = "-"*print_width
puts "\n" + separator
puts "M A S T E R M I N D".center(print_width)
puts
puts "Conditions:"
puts "  #{colors.length} colors (#{colors.join(", ")})"
puts "  #{guesses} guesses"
puts
puts "Instructions:"
puts "  play            Play both sides"
puts "    -b   breaker: Play as codebreaker vs AI"
puts "    -m   maker:   Play as codemaker vs AI"
puts "    -a   ai:      Cede both sides to AI"
puts "    -d   debug:   Show debug messages"
puts separator + "\n"




codemaker = Player.new
codebreaker = Player.new
board = Board.new
