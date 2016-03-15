# Default Variables ############################################################
  @title = "Mastermind"
  @colors = 6            # Should exceed 1.
  @guesses = 10          # Should exceed 0. Guesses equate to rows.
  @menu_width = 45
# Booleans
  @allow_debug = true
  @allow_cheat = true
  @maker_ai = false
  @breaker_ai = false
# Commands and arguments
  @all_arguments = { "play" => [nil, "-b", "-m", "-a", "-d"], \
    "quit" => [nil, "-r", "-e"], "code" => [nil] }

# Initialize Defaults ##########################################################
  @colors = (((1 + 64).chr)..((@colors + 64).chr)).to_a   # Converts to letters.
# Build main program arguments list
  @main_arguments = @all_arguments.clone
  @main_arguments["play"].delete("b") if !@maker_ai
  @main_arguments["play"].delete("m") if !@breaker_ai
  @main_arguments["play"].delete("a") if !@breaker_ai || !@maker_ai
  @main_arguments["play"].delete("d") if !@allow_debug
  @main_arguments.delete("code") if !@allow_cheat
# Build game loop arguments list
  @game_arguments = @all_arguments.clone
  @game_arguments.delete("play")
  @game_arguments["quit"].delete(nil)
  @game_arguments["quit"].delete("r")
################################################################################

#require "logger"
#$log = Logger.new(STDOUT)
#$log.level = Logger::DEBUG

# $log.debug "Sample debug message"

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
  puts "  play           Play codemaker and -breaker"
  puts "    -b  breaker  Play as codebreaker vs AI" if @maker_ai
  puts "    -m  maker    Play as codemaker vs AI" if @breaker_ai
  puts "    -a  ai       Cede both sides to AI" if @maker_ai && @breaker_ai
  puts "    -d  debug    Show debug messages" if @allow_debug
  puts "  quit           Quit the current game"
  puts "    -r  restart  Restart the current game"
  puts "    -e  end      End the program"
  puts "  code           Show codemaker's code" if @allow_cheat
  puts "\n" + separator + "\n"
end

print_menu

def valid_command?(command, arguments, command_list)
  puts "Command: #{command}; Arguments: #{arguments.to_s}"
  puts command_list.to_s
  if command_list.key?(command)
    puts "Command validated"
    if (arguments.each { |arg| command_list[command].value?(arg) })
      puts "Argument validated."
    end
  end
end

loop do
  print "COMMAND: "
  arguments = gets.chomp.split(" ")
  command = arguments.shift
  valid_command?(command, arguments, @main_arguments)
  puts
end

############################################################
=begin
IF MAIN:
  Ask for command
  If command, check arguments
    Do command and arguments
  Else
    Say failed
REPEAT

IF GAME:
  Ask for command
  If command, check arguments
    Do command and arguments
  Elsif code, check code
    Handle code appropriately
  Else
    Say failed
REPEAT

Play is invalid if 

Ask for command in the loop
repeat the loop if get something invalid
=end
  

=begin

----------------------------------


def ask_command
  arguments = gets.chomp.split(" ")
  command = arguments.shift
  if @all_arguments.key?(command)
    execute_command(command, arguments)
  elsif arguments.nil?
    handle_code(command)
  else
    loop
  end
end


#A command can be in the argument list
#Or it can be a code


ask_command


#First, check if it's an argument
#if it's an argument, do the command
#Next, check if it's a code
#if it's a code, put in the code
#Last, if it's neither, throw it out



end_game = false

def program_loop
  print_menu
  command = get_command
#  if comment
end

def game_loop

end

until end_game
  print_menu
  game_setup
  game_loop
end

def get_command
  print "Command: "

end

def ask_command
  print "Command: "
  command = gets.chomp
  
def validate_command(command)
  arguments = command.split(" ")
  command = arguments.shift
  if @argument

  command = arguments.shift
  if @command_list.includes?(command)
  
  execute_command(command, arguments)
    
  

end
  
#codemaker = Player.new
#codebreaker = Player.new
#board = Board.new






=end




################################################################################
