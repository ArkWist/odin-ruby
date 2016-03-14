module Defaults

  DIMENSION = 3
  BORDER_SPACING = ' '
  
#  def default_dimension
#    DIMENSION
#  end
  
end

module Selections

  def choose_from_options(question, *option)
    question += " (" + option.join("/") + "): "
    response = nil
    until response
      print question
      user_input = gets.chomp.downcase
      if option.include?(user_input)
        response = user_input
      else
        invalid_input
        next
      end
    end
    response
  end
  
  def choose_from_range(question, min, max)
    question += " (#{min} - #{max}): "
    response = nil
    until response
      print question
      user_input = gets.chomp
      if user_input >= min && user_input <= max
        response = user_input
      else
        invalid_input
        next
      end
    end
    response
  end
  
  def invalid_input
    puts "That response is invalid."
  end
  
  def choose_row_index
  end
  
  def choose_column_index
  end

end

module AI

  

end
