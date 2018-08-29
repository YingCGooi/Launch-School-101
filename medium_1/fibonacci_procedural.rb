# def fibonacci(nth)
#   first_num = 1
#   second_num = 1
#   idx = 2

#   loop do
#     idx += 1
#     first_num, second_num = second_num, second_num + first_num
#     break if idx >= nth
#   end

#   second_num
# end


def fibonacci(nth)
  first, second = [1, 1]
  3.upto(nth) do
    first, second = [second, first + second]
  end
  second
end


p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501