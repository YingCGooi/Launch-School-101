# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# n = 9
# [spaces, asterisks, spaces]
# [4, 1, 4] => [n/2-0, 1, n/2-0]
# [3, 3, 3] => [n/2-1, 3, n/2-1]
# [2, 5, 2] => [n/2-2, 5, n/2-2]
# ...
# [0, 9, 0] => [0, n - 0, 0]
# [1, 7, 1] => [1, n - 2, 1]
# [2, 5, 2] => [2, n - 4, 2]
# [3, 3, 3] => [3, n - 6, 3]
# [4, 1, 4] => [4, n - 8, 4]  4 = n/2



# def diamond(n)
#   bottom_part = []
#   (n/2 + 1).times do |idx|
#     bottom_part << [idx, n - idx*2, idx]
#   end
#   bottom_part

#   diamond_arr = bottom_part.reverse + bottom_part[1..-1]
#   diamond_arr.map do |(space, asterisk, _)|
#     ' ' * space + '*' * asterisk
#   end
# end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end



diamond(3)
diamond(9)
