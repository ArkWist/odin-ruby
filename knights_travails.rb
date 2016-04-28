
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
    positions = []
    positions.push(Position.new())expand_next
    
    
    moves = get_moves
    @next = push(Move.new(self, Position.new(@pos.x - 2, @pos.y - 1))
#

  def expand_next
    a, b, moves = @pos.x, @pos.y, []
    moves
#

for i = -2 until i = 3
  x = -2
  
  next if i == 0
  
  i = 2
  def expand(i = 2)
    return if i == -3
    next if i == 0
    Position.new()
    


    a = -2
    b = -2

x-2, y-1
x-2, y+1
x-1, y-2
x-1, y+2
x+1, y-2
x+1, y+2
x+2, y-1
x+2, y+1

-2, -1
+0, +2
+1, -3
+0, +4




1, 2

  def get_next
    a, b, moves = 1, 2, []
    moves += expand(a, b)
    moves += expand(a * -1, b)
    moves += expand(b, a)
    moves += expand(b * -1, a)
take a, return with b and -b
take -a, return with b and -b
take b, return with a and -a
take -b, return with a and -a

  def expand(a, b)
    moves = [Position.new(a, b), Position.new(a, b * -1)]
  end

[]

-2, -1, 1, 2


    
=begin
0 1 2 3 4 5 6 7 8 - X [0]
1
2     -   -  
3   -       -
4       O
5   -       -
6     -   -
7
8 - Y [1]
=end

[4,4] >> [3,2], [5,2]; [2,3], [6,3]; [2,5], [6,5]; [3,6], [5,6]


    

Position
> Array of next positions
> If any next are finish, return



Move
  prior
  pos
  next



x-2, y-1
x-2, y+1
x-1, y-2
x-1, y+2
x+1, y-2
x+1, y+2
x+2, y-1
x+2, y+1



x-2, y-1
x-2, y+1
x-1, y-2
x-1, y+2
x+1, y-2
x+1, y+2
x+2, y-1
x+2, y+1


