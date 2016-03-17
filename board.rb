class Board

  attr_reader :@guesses

  def initialize(rows, colors, code_length)
    # @rows = [] << Row.new * rows
    # @rows[0...rows] = Row.new
    @answer = Row.new(length)
    @guesses = Array.new(rows) { Row.new(length) }
    @colors = colors
    @game_over = false
    @victory = false
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
