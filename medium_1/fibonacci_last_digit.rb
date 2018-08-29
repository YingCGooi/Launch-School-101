# def fibonacci_last(nth)
#   first, second = [1, 1]
#   3.upto(nth) do
#     first = first.to_s[-1].to_i
#     second = second.to_s[-1].to_i
#     first, second = [second, first + second]
#   end
#   second.to_s[-1].to_i
# end

def endings(first_n)
  (0..first_n).map do |idx|
    [idx, fibonacci_last(idx)]
  end .sort_by do |(seq, fib)|
    fib
  end .each do |el|
    p el
  end
end



def fibonacci_last(nth)
  nth = nth.to_s.to_i
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end

endings(2000)
# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4