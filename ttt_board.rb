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
  
  def victorious?(player, move)
    icon = player.player_icon
    row = move[0]
    column = move[1]
    if win_across?(icon, row) || win_down?(icon, column) || win_diagonal?(icon, row, column)
      wins = true
    else
      wins = false
    end
    wins
  end
  
  private
  
  def win_across?(icon, row)
    if @cells[row].all? { |cell| cell.value == icon }
      wins = true
    else
      wins = false
    end
    wins
  end
  
  def win_down?(icon, column)
    wins = true
    for i in 0...@dimension
      if @cells[i][column] != icon
        wins = false
      end
    end
    wins
  end
  
  def win_diagonal?(icon, row, column)
    wins = true
    if row == 0 && column == 0
      for i in 0...@dimension
        if @cells[i][i] != icon
          wins = false
        end
      end
    elsif row == @dimension - 1 && column == 0
      for i in 0...@dimension
        if @cells[@dimension - 1 - i][i] != icon
          wins = false
        end
      end
    else
      wins = false
    end
    wins
  end
  
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


