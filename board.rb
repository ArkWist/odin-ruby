require "row"

class Board

  attr_reader :@guesses

  def initialize(rows, colors, code_length)
    # @rows = [] << Row.new * rows
    # @rows[0...rows] = Row.new
    @answer = Row.new(length)
    @guesses = Array.new(rows) { Row.new(length) }
    @colors = colors
    @code_length = code_length
    @game_over = false
    @victory = false
  end
  
  def print
    puts_separator
    guesses.each_with_index do |row, index|
      string = index < 10 ? print " #{index.to_s}  " : print "#{index.to_s}  "
      puts string + row.printable
      puts_separator
    end
  end
  
  def puts_separator
    puts ("-" * 7) + ("-" * ((@code_length * 3) - 2)) + ("-" * 7) +  \
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
