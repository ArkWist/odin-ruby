def merge_sort(n)
  return n if n.length <= 1
  middle = n.length / 2
  left = merge_sort(n[0...middle])
  right = merge_sort(n[middle..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << left.first < right.first ? left.shift : right.shift
  end
  result += left + right
end

puts merge_sort([6, 5, 3, 1, 8, 7, 2, 4]).to_s 