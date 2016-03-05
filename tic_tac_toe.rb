# Tic-Tac-Toe

class TicTacToe
  def initialize(row_count = 3, column_count = 3)
    @board = TicTacToeBoard.new(row_count, column_count)
    @player_1 = :X
    @player_2 = :Y
  end
end

# Not sure how best to handle players?
# Perhaps as object in the board_
# Or perhaps outside the board, in a game class?

class TicTacToeBoard
  def initialize(row_count = 3, column_count = 3)
    @cells = Array.new(row_count) { Array.new(column_count) { Cell.new(:empty)} }
  end
end


class Cell
  attr_reader :value
  def initialize(value = :empty)
    @value = value
  end
end


loop do
  #puts "Play?: "
  game = TicTacToe.new
  #puts "Default board?: "
  #puts "Rows?: "
  #rows = gets.chomp
  #puts "Columns?: "
  #columns = gets.chomp
  game.set_board_size(3, 3)
  puts "Player 1 is human?: "
  
  puts "Player 2 is human?: "
end

# Cell is an object that can hold player_1, player_2, or empty
# Row is an object that holds cells across
# TicTacToeBoard is an object that holds rows


# So, realistically, you'd have a board made of cells


=begin
Tic-Tac-Toe:

Board
Cell


Board > 3 Row > 3 Cell

Enter location through grid
3
2
1
  A B C

start with rows and columns depths

need a way to check win conditions
check rows
check columns
check diagonals


game loop

take input
validated input
update board (draw lines)
check win conditions
if win allow restart
otherwise swap player

end

board is a class
    row is a class
        cell is a class


turns ar X and O

play(TicTacToe)


class TicTacToe
    def initialize(players)
        @players = players
        @
    end
=end

