class Row

  def initialize(length)
    @code = Code.new(length)
    @score = Score.new(length)
  end
  
  def print_row
    puts ""
  end
  
  def add_guess(guess)
    @code.add(guess)
  end
  
end

class Pegs

  def initialize(length)
    @pegs = Array.new(length)
  end
  
  def add(pegs)
    @pegs = pegs
  end
  
end

class Code < Pegs
end

class Score < Pegs
end
