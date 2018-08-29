# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# first line starts with one *
# last line starts with number of stars equals to the positive integer

def triangle(integer)
  integer.times do |x|
    row_number = x + 1
    puts (" " * (integer - row_number)) + ("*" * row_number)
  end
end

def further_triangle(integer, coord = 1)
  case coord
  when 1 then integer.downto(1) { |x| puts ("*" * x).ljust(integer) }
  when 2 then integer.downto(1) { |x| puts ("*" * x).rjust(integer) }
  when 3 then 1.upto(integer) { |x| puts ("*" * x).ljust(integer) }
  when 4 then 1.upto(integer) { |x| puts ("*" * x).rjust(integer) }
  end
end

further_triangle(5, 4)
triangle(9)

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****
# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********