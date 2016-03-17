class Row

  def initialize(length)
    @code = Code.new(length)
    @score = Score.new(length)
  end

end

class Pegs

  def initialize(length)
    @pegs = Array.new(length)
  end
  
end



class Code < Pegs

end

class Score < Pegs

end
