# ConnectFour

class ConnectFour
  PLAYERS = [:X, :O]
  attr_reader :board, :player

  def initialize
    width, height = 7, 6
    @board = Board.new(width, height)
    setup_game
    play
  end
  
  def setup_game
    @board.wipe
    @player = PLAYERS.first
    @board.display
  end
  
  def play
    first_move = true
    until game_set?
      first_move ? first_move = false : next_player
      move
      @board.display
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
      move
    end
  end

  
  
  def game_set?
    @board.victory?
  end
  
  def game_set
    puts "Player #{@board.last_player} is victorious!"
    puts
  end
  
  
  
  def replay?
    print "Replay? (y/n): "
    assertion = gets.chomp.downcase
    if valid_assertion?(assertion)
      assertion == "y" ? again = true : again = false
    else
      puts "Invalid input."
      again = replay?
    end
    again
  end
  
  def replay
    setup_game
    play
  end
  
  def valid_assertion?(assertion)
    assertion == "y" || assertion == "n"
  end
    
end



class Board
  attr_reader :columns, :last_player

  def initialize(width, height)
    #@columns = Array.new(width){ Array.new }
    @width = width
    @height = height
    wipe
    #@last_player, @last_move = nil, nil
  end

  def wipe
    #@columns.each { |col| col.each { Array.new } }
    @columns = Array.new(@width){ Array.new }
    @last_player, @last_move = nil, nil
  end
  
  
  
  def display
    puts
    puts ascii_separator
    (@height - 1).downto(0) do |i|
      puts ascii_cells(i)
      puts ascii_separator
    end
    puts ascii_labels
    puts
  end
  
  def ascii_separator
    separator = " "
    @width.times{ separator << "--- " }   # Would separator << @width.times{ "---" } work?
    separator
  end
  
  def ascii_cells(row)
    cells = "|"
    @columns.each do |col|
      col[row] ? cells << " #{col[row]} |" : cells << "   |"
    end
    cells
  end

  def ascii_labels
    labels = " "
    @width.times { |i| labels << " #{i}  " }
    labels
  end
  
  
  
  def make_move(player, choice)
    @columns[choice.to_i].push(player)
    @last_player = player
    @last_move = choice.to_i
  end
  
  def valid_move?(choice)
    #choice.is_a?(Integer) && col_exists?(choice) && !col_full?(choice)
    is_integer?(choice) && col_exists?(choice.to_i) && !col_full?(choice.to_i)
  end

  def is_integer?(choice)
    choice.to_i == 0 && choice != "0" ? false : true
  end
  
  def col_exists?(choice)
    choice.between?(0, @width)
  end
  
  def col_full?(choice)
    @columns[choice].length >= @height
  end
  
  def find_open_row(choice)
    @columns[choice].length
  end
  
  
  
  def victory?
    !@last_move.nil? && (horizontal_win? || vertical_win? || ne_diagonal_win? || se_diagonal_win?)
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



game = ConnectFour.new
