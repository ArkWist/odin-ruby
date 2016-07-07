

def stock_picker (stock_list)
  profit, best_days = 0, [0, 0]
  stock_list.each_with_index do |buy_price, buy_i|
    stock_list[(buy_i + 1)..-1].each_with_index do |sell_price, sell_i|
      if sell_price - buy_price > profit
        best_days[0] = buy_i
        best_days[1] = sell_i + buy_i + 1
        profit = sell_price - buy_price
      end
    end
  end
  best_days
end

print "Input stock prices (separated with commas): "
stock_prices = gets.chomp
stock_prices = stock_prices.split(",").map { |price| price.to_i }
best_days = stock_picker(stock_prices)

puts best_days[1] == 0 ? "Best not buy anything!" : best_days.to_s

