# Required by class::TicTacToe.
# Shares namespace with class:TicTacToe.

class Player
  def initialize(icon = '?', human = true)
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
  
  def make_move
    print "Choose your position: "
    answer = gets.chomp.downcase
    if answer.is_empty?
    end
  end
end