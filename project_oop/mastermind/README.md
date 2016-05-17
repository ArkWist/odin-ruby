# Mastermind

A command line Mastermind game.

## Features

* User definable number of colors and rows
* User definable code length
* ~~Human or AI play for either side~~

## Installation

1. Load `mm.rb` in the IRB
2. Enter `play` commands to start the game

## Full Command List

`play`  Play as codemaker and codebreaker  
`play` `-b`  Play as codebreaker vs AI  
`play` `-m`  Play as codemaker vs AI  
`play` `-a`  Watch the AI play both sides  
`play` `-d`  Show debug messages  
`quit`  Quit the current game  
`quit` `-r`  Restart the current game  
`quit` `-e`  Exit the program  
`show`  Show the answer (codemaker's code)

## How to Play

1. The codemaker enters a code of allowed length and color (letter) composition.
2. The codebreaker tries to guess the code.
3. The codemaker rates the accuracy of the code.
  * `!` = right color, right spot
  * `:` = right color, wrong spot
  * `.` = wrong color
4. The codebreaker wins if they guess the code before they run out of rows.
5. The codemaker wins if the codebreaker runs out of rows.

## About

Written for [The Odin Project](http://www.theodinproject.com/). See **[Project: OOP with Ruby](http://www.theodinproject.com/ruby-programming/oop)** for more information.
