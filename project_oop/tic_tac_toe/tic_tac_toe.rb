

class TicTacToe
  PLAYERS = [:X, :O]
  
  def initialize
    @board = Board.new
    @player = PLAYERS.first
  end
  
  def play
    print_board
    victor = false
    until victor || is_draw?
      take_turn(@player)
      is_victorious?(@player) ? victor = @player : next_player
      print_board
    end
    print_victor(victor)
  end
  
  private
  
  def print_board
    puts
    puts @board.to_s
  end
  
  # As things stand, @player can always replace player.
  # player is passed around for the sake of modularity.
  def take_turn(player)
    ask_move(player)
    input = gets.chomp
    is_valid_move?(input) ? make_move(player, input) : redo_turn
  end
  
  def ask_move(player)
    puts
    print "Player #{player}'s move: "
  end
  
  def redo_turn(player)
    puts "Invalid move. Try again."
    take_turn(player)
  end
  
  #############################################################################
  # Move legality checks ######################################################
  
  def is_valid_move?(input)
    proceed = is_legal_move?(input) && is_open_space?(input)
  end
  
  def is_legal_move?(input)
    files, ranks = get_legal_spaces
    file, rank = decompile_move(input)
    legal = files.include?(file) && ranks.include?(rank) && "#{file}#{rank}".length == 2
  end
  
  def is_open_space?(input)
    file, rank = convert_to_index(input)
    open = @board.is_open_space?(file, rank)
  end
  
  # This only works with board sizes up to 9 x 9.
  def decompile_move(input)
    input.downcase!
    file, rank = input[0], input[1]
  end
  
  def get_legal_spaces
    files, ranks = ("a".."i").to_a.take(@board.get_size), ("1".."9").to_a.take(@board.get_size)
  end
  
  def convert_to_index(input)
    file, rank = decompile_move(input)
    files, ranks = ("a".."i").to_a.take(@board.get_size), ("1".."9").to_a.take(@board.get_size)
    file, rank = files.index(file), ranks.index(rank.to_s)
  end
  
  #############################################################################
  # Game progress actions #####################################################
  
  def next_player
    @player = if @player == PLAYERS[-1] then PLAYERS[0] else PLAYERS[PLAYERS.index(@player) + 1] end
  end
  
  def make_move(player, input)
    file, rank = convert_to_index(input)
    @board.place_mark(player, file, rank)
  end
  
  def print_victor(victor = nil)
    puts
    puts victor ? "Player #{victor} is victorious." : "Game is a draw."
  end
  
  #############################################################################
  # Vicory checks (these poll the game board) #################################
  
  def is_victorious?(player)
    victorious = @board.is_victorious?(player)
  end
  
  def is_draw?
    draw = @board.is_draw?
  end
  
end


class Board
  
  #############################################################################
  # Public Methods ############################################################
  
  def initialize(dimension = 3)
    @spaces = Array.new(dimension) { Array.new(dimension) { :empty } }
  end
  
  def to_s
    string = ""
    get_size.downto(1) { |rank| string += get_rank_string(rank) }
    string += get_file_labels
    string
  end
  
  def place_mark(player, file, rank)
    @spaces[file][rank] = player
  end
  
  def get_size
    @spaces.length
  end
  
  def is_open_space?(file, rank)
    open = @spaces[file][rank] == :empty
  end
  
  #############################################################################
  # Game set checks ###########################################################
  
  def is_victorious?(player)
    victorious = win_down?(player) || win_across?(player) || win_diagonally?(player)
  end
  
  def is_draw?
    draw = true
    @spaces.each_with_index { |file, f| file.each_with_index { |rank, r| draw = !is_open_space?(f, r) if draw } }
    draw
  end
  
  private
  
  #############################################################################
  # Board to string handling ##################################################
  
  def get_rank_string(rank)
    string = "#{rank} "
    1.upto(get_size) { |file| string += "[#{get_space_char(file - 1, rank - 1)}]" }
    string = string + "\n"
  end
  
  def get_file_labels
    string = "  "
    files = ("A".."Z").to_a.take(get_size)
    files.each { |label| string += " #{label} " }
    string = "\n" + string
  end
  
  def get_space_char(file, rank)
    symbol = @spaces[file][rank]
    char = symbol == :empty ? " " : symbol.to_s
  end
  
  #############################################################################
  # Victory checks ############################################################
  
  def win_down?(player)
    win = false
    0.upto(get_size - 1) do |file|
      down = true
      0.upto(get_size - 1) { |rank| down = @spaces[file][rank] == player unless !down }
      win = down if !win
    end
    win
  end
  
  def win_across?(player)
    win = false
    0.upto(get_size - 1) do |rank|
      across = true
      0.upto(get_size - 1) { |file| across = @spaces[file][rank] == player unless !across }
      win = across if !win
    end
    win
  end
  
  def win_diagonally?(player)
    win = win_northeast?(player) || win_southeast?(player)
  end
  
  def win_northeast?(player)
    win = true
    0.upto(get_size - 1) { |pt| win = @spaces[pt][pt] == player if win }
    win
  end
  
  def win_southeast?(player)
    win = true
    0.upto(get_size - 1) { |pt| win = @spaces[pt][get_size - 1 - pt] == player if win }
    win
  end
  
end

game = TicTacToe.new
game.play

