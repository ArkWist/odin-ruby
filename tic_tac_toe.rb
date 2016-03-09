require "ttt_game.rb"
require "ttt_helper.rb"

include Selections

def ask_new_game
  response = Selections.choose_from_options('Start a new game?', 'y', 'n')
  case response
  when 'y'
    new_game = true
  when 'n'
    new_game = false
    puts "Game over."
  end
  new_game
end

play_ttt = true
while play_ttt
  game = TTTGame.new
  play_ttt = ask_new_game
end

