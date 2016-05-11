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
  
  def move
    print "Player #{@player}'s move: "
    choice = gets.chomp
    if @board.valid_move?(choice)
      @board.make_move(@player, choice)
    else
      puts "Invalid move. Try again."
    end
  end
 
  def game_set?
  end
  
  def game_set
  end
  
  
end



class Board

  attr_reader :column

  def initialize(width, height)
    @column = Array.new(width){Array.new(height)}
  end
  
  def wipe
    @column.each { |col| col.each { |row| row = nil } }
  end
  
  def make_move(player, choice)
    @column[choice].push(player)
  end
  
  def valid_move?(choice)
    choice.is_a? Integer && col_exists?(choice) && !col_full?(choice) ? true : false
  end

  def col_exists?(choice)
    choice.between?(0, column.length)
  end
  
  def col_full?(choice)
    @column[choice].last == nil ? false : true
  end
end