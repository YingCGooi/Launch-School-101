# Modify the following code so that the loop stops if number is between 0 and 10.

loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

# inside the loop, we are assigning a random integer from 1 to 100 to number upon each iteration,
# Our goal is to create a condition that stops the loop of number is between 0 and 10.
# we chose to use the `Comparable#between?` method. #between? takes two arguments and returns a boolean. true or false. If the caller's value is between the two integers provided, in this case, we use it in an if condition that will execute break when #between? returns true.