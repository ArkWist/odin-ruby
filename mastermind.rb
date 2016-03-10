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

class Player
  class Human < Player
  class AI < Player

class Board
  def draw
  class Row
    class Score
    class Guess
