module Defaults

  DIMENSION = 3
  BORDER_SPACING = ' '
  
end

module Selections

  def choose_from_options(question, *option)
    question += ' (' + option.join('/') + '): '
    response = nil
    until response
      print question
      user_input = gets.chomp.downcase
      if user_input.include?(option)
        response = user_input
      else
        continue
      end
    end
    response
  end
  
  def choose_from_range(question, min, max)
    question += ' (#{min} - #{max}): '
    response = nil
    until response
      print question
      user_input = gets.chomp
      if user_input >= min && user_input <= max
        response = user_input
      else
        continue
      end
    end
    response
  end
  
  def choose_row_index
  
  def choose_column_index


end
