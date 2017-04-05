# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Example int = 123
def sum(int)
  sum = 0
  int.to_s.split('').each { |x| sum += x.to_i }
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

def challenge_sum(int)
  int.to_s.split('').map(&:to_i).reduce(:+)
end

# (&:to_i) symbol represents {|x| x.to_i}

puts challenge_sum(23) == 5
puts challenge_sum(496) == 19
puts challenge_sum(123_456_789) == 45