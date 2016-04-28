
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
  def initialize(prior, pos)
    @prior = prior
    @pos = pos
    @next = []
  end
  def find_next
    @next = @pos

    
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
    

Position
> Array of next positions
> If any next are finish, return



Move
  prior
  pos
  next




