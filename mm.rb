################################################################################
#                                                                              #
#                                  Mastermind                                  #
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

def get_commands
  args = gets.chomp.delete(" ").split(/(?=[-])/)
  cmd = args.shift
  args = [:no_arg] if args.empty?
  return cmd, args
end

def invalid_command(cmd, args, legal_args)
  if !valid_command?(cmd, args, @all_args)      # Check command exists.
    puts "Command not recognized."
    valid = false
  elsif !valid_command?(cmd, args, legal_args)  # Check command is legal.
    puts "Command not legal."
    valid = false
  end
  return true && valid
end

def valid_command?(cmd, args, legal_cmds)
  valid = legal_cmds.key?(cmd) &&  \
    args.all? { |arg| legal_cmds[cmd].include?(arg) } ? true : false 
end

# Command Execution ############################################################

def execute_command(cmd, args)
  case cmd
  when "play"
    codebreaker, codemaker = false
    case args
    when args.include?(:no_arg)
      codebreaker, codemaker = true
    when args.include?("-b")
      codebreaker = true
    when args.include?("-m")
      codemaker = true
    when args.include?("-d")
      enable_debug
    end
    start_game(codebreaker, codemaker)
  when "quit"
    case args
    when args.incude?(:no_arg)
### LEFT OFF HERE

### HOW SHOULD THE GAME BE QUIT? HOW END THE GAME LOOP?
  
  end
      
    
  
end

private :execute_command

################################################################################
# Main Program (main loop)                                              [main] #
################################################################################

print_menu

loop do
  print "COMMAND: "
  cmd, args = get_commands

  next if invalid_command(cmd, args, @main_args)
  break if cmd == "quit" && args.include?("-e")
  
  execute_command(cmd, args)
end

################################################################################

#codemaker = Player.new
#codebreaker = Player.new
#board = Board.new

################################################################################
