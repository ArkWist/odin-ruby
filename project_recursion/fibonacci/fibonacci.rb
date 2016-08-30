def fibs(number)
  fib = []
  while fib.length < 2 && number - fib.length > 0
    fib << fib.length
  end
  (number - 2).times do |i|
    fib << (fib[i] + fib[i+1])
  end
  fib
end

def fibs_rec(n)
  if n == 1
    fib = 0
  elsif n == 2
    fib = [fibs_rec(n - 1), fibs_rec(n - 1) + 1]
  else
    fib = fibs_rec(n - 1) << (fibs_rec(n - 1).at(-1) + fibs_rec(n - 1).at(-2))
  end
end
