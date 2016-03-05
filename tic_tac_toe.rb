# Tic-Tac-Toe

class TicTacToe
  def initialize(row_count=3, column_count=3)
    @player_1 = "X"
    @player_2 = "O"
    @rows = Array.new(row_count, Row.new(column_count))
  end
end

class Row
  def initialize(column_count=3)
    @columns = Array.new(column_count, Cell.new)
  end
end

class Cell
  def initialize
    @value = nil
  end
end
    

#def tic_tac_toe; end