def fibs(n)
  fib = []
  while fib.length < 2 && n - fib.length > 0
    fib << fib.length
  end
  (n - 2).times do |i|
    fib << (fib[i] + fib[i + 1])
  end
  fib
end

def fibs_rec(n)
  if n == 1
    [0]
  elsif n == 2
    fibs_rec(n - 1) << fibs_rec(n - 1).at(-1) + 1
  else
    fibs_rec(n - 1) << (fibs_rec(n - 1)[-1] + fibs_rec(n - 1)[-2])
  end
end
