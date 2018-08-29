# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

def sum_square_difference(num)
  (1..num).reduce(:+)**2 - (1..num).map {|x| x**2}.reduce(:+)
end

p sum_square_difference(3) == 22
   p # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
