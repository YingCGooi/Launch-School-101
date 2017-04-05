# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

# Examples:
def average(array)
  array.reduce(:+) / array.size.to_f # to return a float
end


puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
# The tests above should print true.