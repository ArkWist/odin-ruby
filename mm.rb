################################################################################
#                                                                              #
#                              M A S T E R M I N D                             #
#                                                                              #
#                                       https://github.com/ArkWist/mastermind/ #
# ---------------------------------------------------------------------------- #
#                                                                              #
# Navigation                                                                   #
#                                                                              #
#   [setup]    Initialization                (defaults & main class variables) #
#   [modules]  Modules and External Classes  (requires)                        #
#   [methods]  Main Methods                                                    #
#   [main]     Main Program                                                    #
#                                                                              #
################################################################################

################################################################################
# Initialization                                                       [setup] #
################################################################################

# Default Variables ############################################################
  @title = "Mastermind"
  @colors = 6       # Should exceed 1.
  @guesses = 10     # Should exceed 0. Guesses equate to rows.
  @code_length = 4
  @menu_width = 47

# Booleans
  @allow_debug = true
  @allow_show = true
  @maker_ai = false
  @breaker_ai = false
  @all_args = { "play" => [:no_arg, "-b", "-m", "-a", "-d"],  \
                "quit" => [:no_arg, "-r", "-e"],              \
                "show" => [:no_arg] }

# Initialize Defaults ##########################################################
  @colors = (((1 + 64).chr)..((@colors + 64).chr)).to_a  # Converts to letters.

# Main program arguments list
  @main_args = Hash.new
  @main_args["play"] = [:no_arg]
  @main_args["play"] += ["-b"] if @maker_ai
  @main_args["play"] += ["-m"] if @breaker_ai
  @main_args["play"] += ["-a"] if @maker_ai && @breaker_ai
  @main_args["play"] += ["-d"] if @allow_debug
  @main_args["quit"] = ["-e"]
  @main_args["show"] = [:no_arg] if @allow_show

# Game loops argument list
  @game_args = Hash.new
  @game_args["quit"] = ["-r", "-e"]
  @game_args["show"] = [:no_arg] if @allow_show

################################################################################
# Modules and External Classes                                       [modules] #
################################################################################

#require "logger"
#$log = Logger.new(STDOUT)
#$log.level = Logger::DEBUG

#$log.debug "Sample debug message 1"
#$log.debug("Sample debug message 2")

################################################################################
# Main Methods                                                       [methods] #
################################################################################

def print_menu
  separator = "-" * @menu_width
  puts "\n" + separator
  puts @title.split("").join(" ").upcase.center(@menu_width)
  puts
  puts "Conditions:"
  puts "  #{@colors.length} colors (#{@colors.join(", ")})"
  puts "  #{@guesses} guesses"
  puts
  puts "Instructions:"
  puts "  play           Play as codemaker and breaker"
  puts "    -b  breaker  Play as codebreaker vs AI" if @maker_ai
  puts "    -m  maker    Play as codemaker vs AI" if @breaker_ai
  puts "    -a  ai       Cede both sides to AI" if @maker_ai && @breaker_ai
  puts "    -d  debug    Show debug messages" if @allow_debug
  puts "  quit           Quit the current game"
  puts "    -r  restart  Restart the current game"
  puts "    -e  end      End the program"
  puts "  show           Show codemaker's code" if @allow_show
  puts "\n" + separator + "\n"
end

# Command Handling #############################################################

#def get_commands
#  args = gets.chomp.delete(" ").split(/(?=[-])/)
#  cmd = args.shift
#  args = [:no_arg] if args.empty?
#  return cmd, args
#end

def get_cmds
  cmd, args = separate_cmds(gets.chomp)
  return cmd, args
end

def separate_cmds(args)
  args = args.delete(" ").split(/(?=[-])/)
  cmd = args.shift
  args = [:no_arg] if args.empty?
  return cmd, args
end

def invalid_cmd?(cmd, args, legal_args)
  if !valid_cmd?(cmd, args, @all_args)      # Check command exists.
    puts "Command not recognized."
    invalid = true
  elsif !valid_cmd?(cmd, args, legal_args)  # Check command is legal.
    puts "Command not legal."
    invalid = true
  end
  return true && invalid
end

def valid_cmd?(cmd, args, legal_cmds)
  valid = legal_cmds.key?(cmd) &&  \
    args.all? { |arg| legal_cmds[cmd].include?(arg) } ? true : false 
end

# Command Execution ############################################################

def execute_cmd(cmd, args)      # Call only if ::invalid_command is false!
  case cmd
  when "play"
    proc = get_play_proc(args)
  when "quit"
    proc = get_quit_proc(args)
  when "show"
    proc = get_show_proc(args)
  end
  proc
end

def get_play_proc(args)
  human_maker, human_breaker = false
  case args
  when args.include?(:no_arg)
    human_maker, human_breaker = false
  when args.include?("-b")
    human_breaker = true
  when args.include?("-m")
    human_maker = true
  when args.include?("-a")
    human_maker, human_breaker = false
  when args.include?("-d")
    enable_debug
  end
  proc = Proc.new { new_game(human_maker, human_breaker) }
end

def get_quit_proc(args)
  case args
  when args.include?(:no_arg)
    proc = Proc.new { quit_game }
  when args.include?("-r")
    proc = Proc.new { restart_game }
  when args.include?("-e")
    proc = Proc.new { quit_program }
  end
  proc
end

def get_show_proc(args)
  case args
  when args.include?(:no_arg)
    proc = Proc.new { show_code }
  end
  proc
end

# Command Procedures ###########################################################

def new_game(human_maker, human_breaker)
puts "PROC: new_game"
  board = Board.new(@guesses, @colors, @code_length)
  codemaker = assign_player(human_maker)
  codebreaker = assign_player(human_breaker)
  answer = get_answer(codemaker)
  game_loop(board, codemaker, codebreaker, answer)
end

def enable_debug
puts "METHOD: enable_debug"
end

def quit_game
puts "PROC: quit_game"
end

def restart_game
puts "PROC: restart_game"
end

def quit_program
puts "PROC: quit_program"
end

def show_code
puts "PROC: show_code"
end

# Command Procedure Helper Methods #############################################

def assign_player(is_human)
  is_human ? Human.new : Comp.new(@colors, @code_length)
end

def get_answer(codemaker)
  loop do
    answer = codemaker.get_code
    cmd, args = separate_cmds
    
    if !invalid_cmd?(cmd, args, @game_args)
      execute_cmd(cmd, args).call
    end
    
  end
end

# Game Loop ####################################################################

def game_loop(board, codemaker, codebreaker, answer)
  board.guesses.each do |row|
  
    board.print
  
  end

end

################################################################################
# Main Program (main loop)                                              [main] #
################################################################################

print_menu

loop do
  print "COMMAND: "
  cmd, args = get_cmds

  next if invalid_cmd?(cmd, args, @main_args)
  execute_cmd(cmd, args).call
end


################################################################################
