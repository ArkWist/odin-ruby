require "./row.rb"

class Board

  attr_reader :guesses

  def initialize(rows, colors, code_length)
    @answer = Row.new(code_length)
    @guesses = Array.new(rows) { Row.new(code_length) }
    @colors = colors
    @code_length = code_length
    @game_over = false
    @victory = false
  end
  
  def print
    puts
    puts separator
    @guesses.each_with_index do |row, index|
      string = index < 9 ? " #{(index + 1).to_s}  " : "#{(index + 1).to_s}  "
      puts string + row.printable
      puts separator
    end
    puts
  end
  
  def separator
    return ("-" * 7) + ("-" * ((@code_length * 3) - 2)) + ("-" * 7) +  \
      ("-" * @code_length) + ("-" * 2)
  end
  
  
  def game_over(with_victory = false)
    @game_over = true
    @victory = with_victory
  end
  
  def game_over?
    @game_over
  end
  
  def with_victory?
    @victory
  end
  
end
