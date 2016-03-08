# Required by class::TicTacToe.
# Shares namespace with class:TicTacToe.

class Player
  def initialize(icon = '?', controller = :unknown)
    @icon = icon
    @controller = controller
  end
  def is_human?
    if @controller == :human
      return true
    else
      return false
    end
  end
  def is_computer?
    !@human
  end
  def set_icon(icon)
    @icon = icon
  end
  
   
  def set_controller(controller)
    case controller
    when :human
      @human = true
    when :computer
      @human = false
    else
      puts "Invalid controller set to human."
      @human = true
    end
  end
  
  def get_controller
    
    
  def toggle_human_computer
    @human = !@human
  end
  
  def make_move
    print "Choose your position: "
    answer = gets.chomp.downcase
    if answer.is_empty?
    end
  end
end