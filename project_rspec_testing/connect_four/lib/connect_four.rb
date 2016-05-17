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
  
  private
  def setup_game
    @board.wipe
    @player = PLAYERS.first
    @board.display
  end
  
  private
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

  
  
  private
  def next_player
    @player == PLAYERS.first ? @player = PLAYERS.last : @player = PLAYERS.first
  end
  
  private
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

  
  
  private
  def game_set?
    @board.victory?
  end
  
  private
  def game_set
    puts "Player #{@board.last_player} is victorious!"
    puts
  end
  
  
  
  private
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
  
  private
  def replay
    setup_game
    play
  end
  
  private
  def valid_assertion?(assertion)
    assertion == "y" || assertion == "n"
  end
    
end



class Board
  attr_reader :columns, :last_player

  def initialize(width, height)
    @width = width
    @height = height
    wipe
  end

  public
  def wipe
    @columns = Array.new(@width){ Array.new }
    @last_player, @last_move = nil, nil
  end
  
  
  
  public
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
  
  private
  def ascii_separator
    separator = " "
    @width.times{ separator << "--- " }
    separator
  end
  
  private
  def ascii_cells(row)
    cells = "|"
    @columns.each do |col|
      col[row] ? cells << " #{col[row]} |" : cells << "   |"
    end
    cells
  end

  private
  def ascii_labels
    labels = " "
    @width.times { |i| labels << " #{i}  " }
    labels
  end
  
  
 
  public
  def make_move(player, choice)
    @columns[choice.to_i].push(player)
    @last_player = player
    @last_move = choice.to_i
  end
  
  public
  def valid_move?(choice)
    is_integer?(choice) && col_exists?(choice.to_i) && !col_full?(choice.to_i)
  end

  private
  def is_integer?(choice)
    choice.to_i == 0 && choice != "0" ? false : true
  end
  
  private
  def col_exists?(choice)
    choice.between?(0, @width)
  end
  
  private
  def col_full?(choice)
    @columns[choice].length >= @height
  end
  
#  def find_open_row(choice)
#    @columns[choice].length
#  end
  
  
  
  public
  def victory?
    !@last_move.nil? && (horizontal_win? || vertical_win? || ne_diagonal_win? || se_diagonal_win?)
  end
  
  private
  def horizontal_win?
    consecutive, victory = 0, false
    depth = @columns[@last_move].length - 1
    @columns[0..-1].each do |col|
      col[depth] == @last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
    end
    victory
  end
  
  private
  def vertical_win?
    consecutive, victory = 0, false
    @columns[@last_move][0..-1].each do |row|
      row == @last_player ? consecutive += 1 : consecutive = 0
      victory = true if consecutive == 4
    end
    victory
  end
  
  private
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
  
  private
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
