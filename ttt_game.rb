require "./ttt_board.rb"
require "./ttt_player.rb"
require "./ttt_helper.rb"

class TTTGame
  include Defaults
  include Selections

  def initialize
    @board = TTTBoard.new
    @players = [Player.new('X'), Player.new('O')]
    set_up_game
    play
  end
  
  private
  
  # Initialize the board and players.
  def set_up_game
    @board = TTTBoard.new(ask_dimension)
    @players = @players.each_with_index do |person, index|
      person.player_number = index + 1
      person.set_controller(ask_controller(person.player_number))
    end
    #@board.set_board
  end
  
  def ask_dimension
    response = Selections.choose_from_options("Use default (#{Defaults::DIMENSION}×#{Defaults::DIMENSION}) board?", 'y', 'n')
    case response
    when 'y'
      dimension = Defaults::DIMENSION
    when 'n'
      dimension = Selections.choose_from_range('How large a board?', '3', '9').to_i
    end
    dimension
  end
  
  # Ask if a player will be human or the computer.
  def ask_controller(player_number)
    response = Selections.choose_from_options("Is Player #{player_number} human?", 'y', 'n')
    case response
    when 'y'
      human_controller = true
    when 'n'
      human_controller = false
    end
    human_controller
  end
  
  def play    
    game_over = false
    current_player = 0
    @board.draw_board
    
    # Primary game loop.
    while !game_over
      move = @players[current_player].make_move(@board)
      if !@board.cell_is_empty?(move)
        next
      else
        move[0] = @board.sanitize_row(move[0])
        @board.set_move(@players[current_player].player_icon, move)
        @board.draw_board
        if @board.is_victorious?(@players[current_player], move)
          game_over = true
        end
        if !game_over
          current_player = next_player(current_player)
        end
      end
    end
    end_game(current_player)
  end
  
  def next_player(current_player)
    if current_player == @players.length - 1
      current_player = 0
    else
      current_player += 1
    end
    current_player
  end
  
  def end_game(winner)
    puts "Player #{winner.player_number} is victorious."
  end
end
