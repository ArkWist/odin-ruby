# ConnectFour

class ConnectFour
  PLAYERS = [:X, :O]
  attr_reader :board, :player

  def initialize
    width, height = 7, 6
    @board = Board.new(width, height)
    setup_game#; play
  end
  
  def setup_game
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
    replay if replay?
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
    @board.victory?
  end
  
  def game_set
    puts "\nPlayer #{@board.last_player} is victorious.\n"
  end
  
  
  
  def replay?
    print "Replay? (y/n): "
    assertion = gets.chomp.downcase
    if valid_assertion?(assertion)
      assertion == "y" ? again = true : again = false
    else
      again = replay?
    end
    again
  end
  
  def replay
    setup_game#; play
  end
  
  def valid_assertion?(assertion)
    assertion == "y" || assertion == "n"
  end
    
end



class Board
  attr_reader :columns, :last_player

  def initialize(width, height)
    @columns = Array.new(width){ Array.new }
    @width = width
    @height = height
    @last_player, @last_move = nil, nil
  end

  def wipe
    @columns.each { |col| col.each { Array.new } }
  end
  
  
  
  def display
    print ascii_separator
    (@height - 1).downto(0) do |i|
      draw_cell(i)
      draw_separator
    end
  end
  
  def ascii_separator
    separator = " "
    @width.times{ separator << "--- " }
    separator
  end
  
  def ascii_cells(row)
    cells = "|"
    @columns.each { |col| cells << " #{col[row]} |" }
    cells
  end
  
  
  
  def make_move(player, choice)
    @columns[choice].push(player)
    @last_player = player
    @last_move = choice
  end
  
  def valid_move?(choice)
    choice.is_a?(Integer) && col_exists?(choice) && !col_full?(choice)
  end

  def col_exists?(choice)
    choice.between?(0, @width)
  end
  
  def col_full?(choice)
    @columns[choice].length >= @height
  end
  
  
  
  def victory?
    horizontal_win? || vertical_win? || ne_diagonal_win? || se_diagonal_win?
  end
  
  def horizontal_win?
    consecutive, victory = 0, false
    depth = @columns[@last_move].length - 1
    @columns[0..-1].each do |col|
      col[depth] == @last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
    end
    victory
  end
  
  def vertical_win?
    consecutive, victory = 0, false
    @columns[@last_move][0..-1].each do |row|
      row == @last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
    end
    victory
  end
  
  def ne_diagonal_win?
    consecutive, victory = 0, false
    position, depth = @last_move, @columns[@last_move].length - 1
    until position == 0 || depth == 0
      position -= 1
      depth -= 1
    end
    until position == @width || depth == @height
      @columns[position][depth] == @last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
      position += 1
      depth += 1
    end
    victory
  end
  
  def se_diagonal_win?
    consecutive, victory = 0, false
    position, depth = @last_move, @columns[@last_move].length - 1
    until position == 0 || depth == @height
      position -= 1
      depth += 1
    end
    until position == @width || depth == -1
      @columns[position][depth] == @last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
      position += 1
      depth -= 1
    end
    victory
  end
  
  
end
