def fibs(number)
  fib = []
  while fib.length < 2 && number - fib.length > 0
    fib << fib.length
  end
  (number - 2).times do |i|
    fib << (fib[i] + fib[i+1])
  end
  fib.to_s
end

#Fn = Fn-1 + Fn-2
#Seed: F0 = 0, F1 = 1

def fibs_rec(number)

end

# How convert this into an array?
def fibs_rec(n)
  if n == 1
    fib = 0
  elsif n == 2
    fib = 1
  else
    fib = fibs_rec(n - 2) + fibs_rec(n - 1)
  end
end

puts fibs(10).to_s
puts fibs_rec(10).to_s


def fibs_rec(n)
  if n == 1
    fib.push = 0
  elsif n == 2
    fib.push = 1
  elsif n > 2
    fib.push = fibs_rec(n - 2) + fibs_rec(n - 1)
  end
end

def fibs_rec(n)
  n - 1 if n <= 2
  fibs_rec(n - 2) + fibs_rec(n - 1) if n > 2
end

def fibs_rec(n)
  n <= 2 ? n - 1 : fibs_rec(n - 2) + fibs_rec(n - 1)
end

#This ought to work, but it doesn't return an array.

number = 4

>4
!1
!2
<< >3 + >2 = 1+1=2
   !1   !1
   !2   &2 = 1^
   << >2 + >1 = 1+0=1
      !1   &1 = 0^
      &2 = 1^

1, 0, 2



