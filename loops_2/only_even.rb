# Using next, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 1
  next if number.odd? # next is placed before #puts since we want the loop to skip executing the remaining lines (in this case, #puts) when the number is odd.
  puts number
end