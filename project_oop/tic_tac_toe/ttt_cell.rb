# Required by class::TTTBoard.
# Shares namespace with class::TTTGame and class::TTTBoard.

class Cell
  attr_reader :value
  def initialize(value = :empty)
    @value = value
  end
  
  def is_empty?
    if @value == :empty
      empty = true
    else
      empty = false
    end
    empty
  end
  
  def to_s
    if is_empty?
      string = ' '
    else
      string = @value.to_s
    end
    string
  end
  
  def set_value(icon)
    @value = icon
  end
end
