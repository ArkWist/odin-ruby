# Mastermind

#Defaults:
#  Allowed colors:  8
#  Number of turns: 10
#  Symbols for right color right position, and right color: perhaps # and % ? Or ○, △, and ×?

#Computer selects a code.
#  Draw the board
#  Player types in guess.
#  Computer scores guess.

#Later:
#Let human choose to select the code or make the guesses.
#If computer guess, guesses randomly but keeps exact matches.

#Later:
#If computer guesses right color but wrong position, try to place the color.

#Player should split into Human and AI
#Board should have Rows
#  Rows should have Scores and Guesses

Main
  @codemaker = Player.new
  @codebreaker = Player.new
  @board

  class Player
    @controller
    ? @player_type
    class Human < Player
    class AI < Player

  class Board
    def draw
    @row_count
    @symbol_count
    @guess_rows[]
    @code_row[]
    class Row
      class Score
        @score
      class Code
        @symbol

# Problem with AI in Tic-Tac-Toe was Player couldn't access Board
# But Board is parallel to Player
# So the main program should pass Board data to Player
# However, for Mastermind, this is unnecessary

Game Loop:
  codemaker choose code
  
  Loop:
    codebreaker makes a guess
    codemaker rates guess (marking interface: automatic? manual?)
    If breaks code
      victory
    If no rows
      loss
  End
End

# Rating the guess should work the same as Making the guess
# Enter perfect and close
# Same interface
# So hold current row:
#   codebreaker puts guess into guess_row::code
#   codemaker (if AI) references code_row
#   codemaker puts rating into guess_row::score
# Then do victory check

# Game should tell Player to do something again if answer makes no sense
# This should not be Player responsibility

#-----------------
#CHECKING COMMANDS
#First, check if it's an argument
#if it's an argument, do the command
#Next, check if it's a code
#if it's a code, put in the code
#Last, if it's neither, throw it out

