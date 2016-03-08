# Tic-Tac-Toe

class TicTacToe
  require "tic_tac_toe_board.rb"
  require "player.rb"

  def initialize
    @board = TicTacToeBoard.new
    @players = [Player.new('X'), Player.new('O')]
    set_up_game
    play
  end
  
  private
  
  def set_up_game
    dimension = ask_dimension
    @board.set_board
  end
  
  def ask_dimension
    DIMENSION = 3
    response = choose_from_options('Use default (#{DIMENSION}x#{DIMENSION}) board?', 'y', 'n')
    unless response == 'y'
      dimension = choose_from_range('How large a board?', '3', '9')
    else
      dimension = DIMENSION
    end
    dimension
  end
  
  
  
  def choose_from_options(question, *option)
    question += ' (' + option.join('/') + '): '
    response = nil
    until response
      print question
      user_input = gets.chomp.downcase
      if user_input.include?(option)
        response = user_input
      else
        continue
      end
    end
    response
  end
  
  def choose_from_range(question, min, max)
    question += ' (#{min} - #{max}): '
    response = nil
    until response
      print question
      user_input = gets.chomp
      if user_input >= min && user_input <= max
        response = user_input
      else
        continue
      end
    end
    response
  end
  
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
    end_game
  end
  
  def next_player(current_player)
    if current_player == @players.length - 1
      current_player = 0
    else
      current_player += 1
    end
    current_player
  end
  
  #private
  
  def set_board(row_count = 3, column_count = 3)
    TicTacToeBoard.new(row_count, column_count)
  end


# Not sure how best to handle players?
# Perhaps as object in the board_
# Or perhaps outside the board, in a game class?



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

