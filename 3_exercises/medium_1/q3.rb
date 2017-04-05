# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  dividend = number
  divisors = []
  loop do # while dividend > 0 do
    break if dividend <= 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(-15)
# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# Bonus 1

# What is the purpose of the number % dividend == 0 ?
'To check whether the number is fully divisible by the dividend (remainder has to be zero)'

# Bonus 2

# What is the purpose of the second-to-last line in the method (the divisors before the method's end)?
"We want to make sure that the array 'divisors' is being returned to the method call. If we omit this line, the return value would be nil"

