
=begin
0 1 2 3 4 5 6 7 8 - X [0]
1
2
3
4
5
6
7
8 - Y [1]
=end

# Make board and knight
# Knight can move forward 2 and side 1, any direction, if doesn't go off edge
# Possible moves are children in a tree
### Which algorithm is good for this? Should allow infinite series
### Continue until hits the right position
# Find shortest path from starting square to target square
# Output that path in a list

class Board
  def initialize(x = 1, y = 1)
    @x_size = x - 1
    @y_size = y - 1
  end
end

class Knight
  def initialize(position)
    @pos = pos
  end
  def moves
    
end

class Position
  attr_reader :x, :y, :pos
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
    @xy = [@x, @y]
  end
end

class MovementTree
  attr_reader :pos, :parent
  def initialize(pos, parent)
    @pos = pos
    @parent = parent
  end
end


board = Board.new(8, 8)
start_pos = []
knight = Knight.new()
moves = MovementTree.new()


Creating a knight for each possible position?

###############

start = Position.new(0,0)
finish = Position.new(3,3)

def knight_moves(start, target)
  knight = Knight.new(start)
  moves = [start]
  until moves.empty?
    current = moves.shift
    return current if current.xy == finish.xy
    moves.push current
###


class Move
  def initialize(prior=nil, pos)
    @prior = prior
    @pos = pos
  end
  def get_next
    x, y = @pos.x, @pos.y
    positions = []
    positions.push(Position.new(x - 2, y - 1))
    positions.push(Position.new(x - 2, y + 1))
    positions.push(Position.new(x - 1, y - 2))
    positions.push(Position.new(x - 1, y + 2))
    positions.push(Position.new(x + 1, y - 2))
    positions.push(Position.new(x + 1, y + 2))
    positions.push(Position.new(x + 2, y - 1))
    positions.push(Position.new(x + 2, y + 1))
    positions = clear_invalid(positions)
     
  end
  def clear_invalid(positions)
  
  end
end
    
    moves = get_moves
    @next = push(Move.new(self, Position.new(@pos.x - 2, @pos.y - 1))
#

  def expand_next
    a, b, moves = @pos.x, @pos.y, []
    moves
#


##############################################################


class Position
  attr_reader :xy
  def initialize(x=0, y=0)
    @xy = [x, y]
  end
end


class Move
  def initialize(prior=nil, pos)
    @prior = prior
    @pos = pos
  end
  def next_moves
    convert_moves(find_valid(next_positions))
    #positions = next_positions
    #valid = find_valid(positions)
    #moves = convert_moves(valid)
  end
  def next_positions
    positions = []
    x, y = @pos.x, @pos.y
    positions.push(Position.new(x - 2, y - 1))
    positions.push(Position.new(x - 2, y + 1))
    positions.push(Position.new(x - 1, y - 2))
    positions.push(Position.new(x - 1, y + 2))
    positions.push(Position.new(x + 1, y - 2))
    positions.push(Position.new(x + 1, y + 2))
    positions.push(Position.new(x + 2, y - 1))
    positions.push(Position.new(x + 2, y + 1))
  end
  def find_valid(positions)
    valid = []
    positions.each do |pos|
      valid << pos if pos.xy.each{ |i| i >= 0 && i < 8 }
    end
    valid
  end
  def convert_moves(positions)
    valid = []
    positions.each do |pos|
      valid << Move.new(self, pos)
    end
    valid
  end
#


#
knight = Position.new(0, 0)
target = Position.new(3, 3)
