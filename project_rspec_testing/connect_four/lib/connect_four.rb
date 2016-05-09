# ConnectFour

class ConnectFour
  PLAYERS = [:X, :O]
  attr_reader :board, :player

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

  def next_player
    @player == PLAYERS.first ? @player = PLAYERS.last : @player = PLAYERS.first
  end
  
  
end



class Board

  def initialize(width, height)
    @column = Array.new(width){Array.new(height)}
  end
  
  def wipe
    @column.each { |col| col.each { |row| row = nil } }
  end
  
end