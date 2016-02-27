def stock_picker (stock_list)

  best_days = [0,0]
  profit = 0

  stock_list.each_with_index do |buy_price, buy_index|
    stock_list.each_with_index do |sell_price, sell_index|

      if sell_price - buy_price > profit then
        best_days[0] = buy_index
        best_days[1] = sell_index
        profit = sell_price - buy_price
      end

    end
  end

  best_days

end

puts "Input stock prices (separated with commas): "
stock_prices = gets.chomp
stock_prices = stock_prices.split(",").map { |price| price.to_i }

best_days = stock_picker(stock_prices)

if best_days[1] == 0
  puts "Best not do anything!"
else
  puts best_days
end


