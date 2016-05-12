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
    first_move = true
    until game_set?
      first_move ? first_move == false : next_player
      move
    end
    game_set
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
    victory = false
    if @board.horizontal_win?
      victory = true
    end
    victory
  end
  
  def game_set
  end
    
end

class Board

  attr_reader :column

  def initialize(width, height)
    @column = Array.new(width){ Array.new }
    @width = width
    @height = height
    @last_player, @last_move = nil, nil
  end
  
  def wipe
    @column.each { |col| col.each { Array.new } }
  end
  
  def make_move(player, choice)
    @column[choice].push(player)
    @last_player = player
    @last_move = choice
  end
  
  def valid_move?(choice)
    choice.is_a?(Integer) && col_exists?(choice) && !col_full?(choice) ? true : false
  end

  def col_exists?(choice)
    choice.between?(0, @column.length)
  end
  
  def col_full?(choice)
    @column[choice].length < @height ? false : true
  end
  
  def horizontal_win?
    depth = @column[last_move].length - 1
    consecutive, victory = 0, false
    @column[0..-1] do |col|
      col[depth] == last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
    end
    victory
  end

end
