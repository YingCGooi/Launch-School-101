# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# def sequence(num)
#   (1..num).each_with_object([]) do |count, new_arr|
#     new_arr << count
#   end
# end

def sequence(num)
  num > 0 ? (1..num).to_a : (num..-1).to_a.reverse
end

p sequence(5)
p sequence(3)
p sequence(1)
p sequence(-3)