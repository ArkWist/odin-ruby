# ConnectFour

class ConnectFour
  PLAYERS = [:X, :O]
  attr_reader :board, player

  def initialize
    width, height = 7, 6
    @board = Board.new(width, height)
    prepare_game
  end
  
  def prepare_game
    @board.wipe
    @player = PLAYERS.first
  end
  
  def play
  
  end

end
