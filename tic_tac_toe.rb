# Tic-Tac-Toe

class TicTacToe
  def initialize
    @board = set_board
    @players = [Player.new('X'), Player.new('O')]
    set_up_game
  end
  
  private
  
  def set_up_game
    #loop
    #print "Default board? (y/n): "
    #answer = gets.chomp.downcase
    #answer_valid = valid_yes_no?(answer)
    #if answer.downcase = "n"
    #  @board = reset_board
    #elsif
    #puts "Rows?: "
    #rows = gets.chomp
    #puts "Columns?: "
    #columns = gets.chomp
    #puts "Player 1 is human?: "
    #puts "Player 2 is human?: "
    play
  
  def play
    #set_board
    #@board = TicTacToeBoard.new(@row_count, @column_count)
    @board.draw_board
    
    #take turn, then check, then set next turn
    game_over = false
    current_player = 0
    
    while !game_over
      @players[current_player].make_move
      @board.draw_board
      @board.check_victory(@players[current_player])
      game_over = @board.game_over?
      unless game_over { current_player = next_player(current_player) }
    end
    @board.end_game
  end  
  
  #private
  
  def set_board(row_count = 3, column_count = 3)
    TicTacToeBoard.new(row_count, column_count)
  end


# Not sure how best to handle players?
# Perhaps as object in the board_
# Or perhaps outside the board, in a game class?

  class TicTacToeBoard
    def initialize(row_count = 3, column_count = 3)
      @cells = Array.new(row_count) { Array.new(column_count) { Cell.new(:empty)} }
    end

    class Cell
      attr_reader :value
      def initialize(value = :empty)
        @value = value
      end
    end

  class Player
    def initialize(icon = '#', human = true)
      @icon = icon
      @human = human
    end
    def is_human?
      @human
    end
    def is_computer?
      !@human
    end
    def set_icon(icon)
      @icon = icon
    end
    def toggle_human_computer
      @human = !@human
    end
      
  
  end

#loop do
  #puts "Play?: "
  game = TicTacToe.new
  #puts "Default board?: "
  #puts "Rows?: "
  #rows = gets.chomp
  #puts "Columns?: "
  #columns = gets.chomp
#  game.play
  #puts "Player 1 is human?: "
  #puts "Player 2 is human?: "
  end
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

