# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

limit = 15 # the local variable 'limit' is initialized at the main scope

def fib(first_num, second_num, limit)
  while second_num < limit # 'limit' is not visible here as no parameters were specified in the method to pass the local variable 'limit' in as an argument. 'limit' is out of scope and not accessible by #fib.
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
# How would you fix this so that it works?
