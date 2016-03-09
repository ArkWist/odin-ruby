# Required by class::TTTGame.
# Shares namespace with class::TTTGame.

class Player
  attr_reader :player_number, :human_controller, :player_icon

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
  
  def make_move
    credible_move = nil
    until credible_move
      print "Choose your position (ex: A2): "
      move = gets.chomp.upcase
      begin
        column = move[0].order - 65
        row = move[1].to_i
      rescue
        puts "Invalid position. Please choose a letter number combination."
      else
        row = move[0].order - 65
        column = move[1].to_i
        credible_move = Array.new(row, column)
      end
    end
    credible_move
  end
end


