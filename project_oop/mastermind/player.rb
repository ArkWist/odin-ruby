class Player

  def victory
    puts
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
  
  def get_score(guess)
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
    print "#{@title}'s guess: "
  
    code = #
  
    puts code
    
    code = Array.new(@code_length) { "A" }
  end
  
  def get_score(guess, answer)
    print "#{@title}'s score: "
  
    score += score_perfect(guess, answer) + score_half(guess, answer)
    score += score_wrong(score, answer)
    
    puts score
    
    score = Array.new(@code_length) { "." }
  end
  
  def score_perfect(guess, answer)
    perfect = ""
    answer.each_with_index do |peg, index|
      perfect += "!" if peg == guess[index]
    end
    perfect
  end
  
  def score_half(guess, answer)
    half = ""
    answer.each_with_index do |peg, index|
      if guess.any?(peg) && peg != guess[index]
        guess[guess.index(peg)] = "#"
        half += ":"
      end
  end
  
  def score_wrong(score, answer)
    score = "." * (answer.length - score.length)
  end


end
