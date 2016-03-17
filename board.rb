class Board

  def initialize(rows, colors)
    # @rows = [] << Row.new * rows
    # @rows[0...rows] = Row.new
    @rows = Array.new(rows) { Row.new }
    @colors = colors
  end
  
end
