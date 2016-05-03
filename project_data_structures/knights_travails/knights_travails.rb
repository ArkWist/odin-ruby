class Position
  attr_reader :x, :y, :xy
  def initialize(x=0, y=0)
    @x = x
    @y = y
    @xy = [x, y]
  end
end

class Move
  attr_reader :prior, :pos
  def initialize(prior=nil, pos)
    @prior = prior
    @pos = pos
  end
  def next_moves
    convert_moves(find_valid(next_positions))
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
      # 8x8 board assumed.
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
end



def knight_moves(knight, target)
  last_move = get_last_move(knight, target)
  path = get_path(last_move)
  puts path_output(path)
end
  
def get_last_move(knight, target)
  moves, last_move = [Move.new(knight)], nil
  until last_move
    next_moves = []
    moves.each{ |move| next_moves << move.next_moves }
    next_moves.flatten!
    next_moves.each do |move|
      last_move ||= move if move.pos.xy == target.xy
    end
    moves = next_moves
  end
  last_move
end

def get_path(last_move)
  prior = last_move.prior
  moves = [last_move]
  until prior.nil?
    moves << prior
    prior = moves.last.prior
  end
  moves.reverse!
end

def path_output(path)
  output = "You made it in #{((path.length)-1).to_s} moves! Here's your path:"
  path.each do |move|
    output += "\n #{move.pos.xy.to_s}"
  end
  output
end



knight = Position.new(0, 0)
target = Position.new(1, 2)
knight_moves(knight, target)

knight = Position.new(0, 0)
target = Position.new(3, 3)
knight_moves(knight, target)

knight = Position.new(3, 3)
target = Position.new(0, 0)
knight_moves(knight, target)

knight = Position.new(3, 3)
target = Position.new(4, 3)
knight_moves(knight, target)

