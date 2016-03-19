class Player

  def victory
    puts "#{@title} is victorious."
  end

end


class Human < Player

  def initialize(is_maker)
    if is_maker
      @title = "CODEMAKER"
    else
      @title = "CODEBREAKER"
    end
    @is_maker = is_maker
  end

  def get_code
    print "#{@title} > Enter your code: "
    gets.chomp
  end
  
  def get_score
    print "#{@title} > Enter your score (!/:/.): "
    gets.chomp
  end

end

class Comp < Player

  def initialize(is_maker, colors, code_length)
    if is_maker
      @title = "CODEMAKER"
    else
      @title = "CODEBREAKER"
    end
    @is_maker = is_maker
    @colors = colors
    @code_length = code_length
  end

  def get_answer
    if is_maker
      answer += code_length.times { colors[Random.rand(code_length - 1)] }
      puts "#{@title} has made a code."
    else
      puts "#{@title} has made a guess."
    end
    answer
  end
  
  def get_code
    code = Array.new(@code_length) { "A" }
  end
  
  def get_score
    score = Array.new(@code_length) { "." }
  end


end
