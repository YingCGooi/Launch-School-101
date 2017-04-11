# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Input:
# Some number
# Output criteria:
# All multiples of 3 and 5 that lie between 1 and some number
# Sum of all those multiples

def multisum(max_number)
  sum = 0
  for current_num in (1..max_number)
    sum += current_num if multiple?(current_num, 3) || multiple?(current_num, 5)
  end
  sum
end

def multiple?(current_num, divisor)
  current_num % divisor == 0
end



p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
