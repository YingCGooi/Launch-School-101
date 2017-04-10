# Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]
iterator = 0

until iterator == numbers.size
  puts numbers[iterator]
  iterator += 1
end