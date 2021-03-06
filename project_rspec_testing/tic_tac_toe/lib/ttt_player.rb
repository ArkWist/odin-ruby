# Required by class::TTTGame.
# Shares namespace with class::TTTGame.

require "./ttt_helper.rb"

class Player
  include AI
  attr_reader :player_number, :human_controller, :player_icon
  attr_writer :player_number

  def initialize(icon = '?', human_controller = true)
    @player_icon = icon
    @human_controller = human_controller
  end
  
  def is_human?
    @human_controller
  end
  
  def is_computer?
    !@human_controller
  end
  
  def set_icon(icon)
    @player_icon = icon
  end
  
  def set_controller(controller)
    @human_controller = controller
  end
    
  def toggle_human_computer
    @human = !@human
  end
  
  def make_move(board)
    if is_human?
      move = human_move
    elsif is_computer?
      move = computer_move(board)
    else
      move = human_move
    end
    move[0] = board.sanitize_row(move[0])
    move
  end
  
  def human_move
    credible_move = nil
    until credible_move
      print "Player #{player_icon.to_s}, choose your position (ex: A2): "
      move = gets.chomp.upcase
      begin
        column = move[0].ord - 65
        row = move[1].to_i - 1
      rescue
        puts "Invalid position formatting. Please choose a letter number combination."
      else
        column = (move[0].ord - 65).to_i
        row = move[1].to_i - 1
        #credible_move = Array.new(row, column)
        credible_move = [row, column]
      end
    end
    credible_move
  end
  
  def computer_move(board)
    
    #check valid moves
  
    #move
  end
  
end
