# Write a method that takes an Array of integers as input, multiplies all of the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places.

def show_multiplicative_average(arr)
  format("%.3f", arr.reduce(:*)/arr.size.to_f)
end

# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts format('%.3f', average)
# end


p show_multiplicative_average([3, 5])
# The result is 7.500

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667