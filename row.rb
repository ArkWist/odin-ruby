class Row

  def initialize(length)
    @code = Code.new(length)
    @score = Score.new(length)
    @code_length = length
  end
  
  def add_guess(guess)
    @code.add(guess)
  end
  
  def add_score(score)
    @score.add(score)
  end
  
  def printable
    return "|  " + @code.get_code.join("  ") + "  |  [ " + @score.get_code.join("") + " ]"
  end
  
end

class Code

  def initialize(length)
    @code = Array.new(length) {"-"}
  end
  
  def add(code)
    @code = code
  end
  
  def get_code
    @code
  end

end

class Score < Code
end
