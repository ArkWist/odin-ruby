# Required by class::TTTGame.
# Shares namespace with class::TTTGame.

require "ttt_cell.rb"
require "ttt_helper.rb"

class TTTBoard
  include Defaults

  def initialize(dimension = Defaults::DIMENSION)
    @dimension = dimension
    @cells = Array.new(dimension) { Array.new(dimension) { Cell.new(:empty)} }
  end
  
  def draw_board
    unless @dimension = 0
      puts row_separator
      @dimension.times do |row_index|
        puts row_cells(row_index)
        puts row_separators
      end
      puts column_labels
  end
  
  def cell_is_empty?(move)
    row = move[0]
    column = move[1]
    row = sanitize_row(row)
    if cell_empty?(row, column)
      empty = true
    else
      empty = false
    end
    empty
  end
  
  def set_move(icon, move)
    row = move[0]
    column = move[1]
    @cells[row][column].set_value(icon)
  end
  
  def victorious?(current_player)
    wins = false
    
    @dimension.times do |seed|
      across = victory_check()
      down = victory_check()
      if seed == 0 || seed == @dimension - 1
        diagonal_down = victory_check()
        diagonal_up = victory_check()
      end
    end
    @dimension.times do |current_column|
      down = victory_check()
    end
  end
  
  def victory_check(seed)
    
  end
      
    
    # check first cell, if then check second, if then check third
  
  end
    
  private
  
  def row_separator
    line = Defaults::BORDER_SPACING + '   ' + (@dimension.times { '---' }).join(' ')
  end
  
  def row_cells(row)
    row_label = (@dimension - row).to_s
    line = Defaults::BORDER_SPACING + row_label
    
    row.times do |current_cell|
      if @cells[current_row][current_cell].is_empty?
        line += '|   '
      else
        line += '| #{@cells[current_row][current_cell]} '
      end
    end
    line += '|'
  end
  
  def column_labels
    line = Defaults::BORDER_SPACING + '    ' + (@dimension.times { |i| (i + 65).chr }).join('   ')
    #line = Defaults::BORDER_SPACING + '   '
    #@dimension.times |column_index|
    #  current_column = column_index + 65
    #  line += ' #{current_column.chr}  '
    #end
    #line
  end
  
  def sanitize_row(row)
    (@dimension - row).abs
  end
  
  def cell_empty?(row, column)
    if cell_exists?(row, column) && @cells[row][column].is_empty?
      empty = true
    else
      empty = false
    end
    empty
  end
  
  def cell_exists?(row, column)
    if (0...@dimension).include?(row) && (0...@dimension).include?(column)
      exists = true
    else
      exists = false
    end
    exists
  end
  
end

#   --- --- ---
#3 |   |   |   |
#   --- --- ---
#2 |   |   |   |
#   --- --- ---
#1 |   |   |   |
#   --- --- ---
#    A   B   C


