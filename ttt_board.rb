# Required by class::TicTacToe.
# Shares namespace with class:TicTacToe.

class TicTacToeBoard
  DIMENSION = 3

  def initialize(dimension = DIMENSION)
    @cells = Array.new(dimension) { Array.new(dimension) { Cell.new(:empty)} }
  end

  def set_board
    ask()
    print "Use default (#{DIMENSION}x#{DIMENSION}) board? (y/n): "
    answer = gets.chomp.downcase
  
  end

end



  class Cell
    attr_reader :value
    def initialize(value = :empty)
      @value = value
    end
  end