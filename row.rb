class Row

  def initialize(length)
    @code = Code.new(length)
    @score = Score.new(length)
    @code_length = length
  end
  
  def add_guess(guess)
    @code.add(guess)
  end
  
  def printable
    return "|  " + @code.join("  ") + "  |  [ " + @score.join + " ]"
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
