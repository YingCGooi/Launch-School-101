# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

def rotate_array(array)
  first, *remainder = array
  [*remainder, first]
end

def rotate_rightmost_digits(num, n)
  digit_arr = num.to_s.chars
  digit_arr[-n..-1] = rotate_array(digit_arr[-n..-1])
  digit_arr.join.to_i
end

# def max_rotation(num)
#   digit_arr = num.to_s
#   digit_arr.size.times do |idx|
#     num = rotate_rightmost_digits(num, digit_arr.size - idx)
#   end
#   num
# end

# def max_rotation(num, n = num.to_s.size)
#   n <= 1 ? num : max_rotation(rotate_rightmost_digits(num, n), n - 1)
# end

def max_rotation(num)
  num_arr = num.to_s.chars
  (num_arr.size - 1).times do |idx|
    num_arr[idx..-1] = num_arr[idx..-1][1..-1] + [num_arr[idx..-1][0]]
  end
  num_arr.join.to_i
end

# def max_rotation(x)
#   (0...x.to_s.size).reduce(x.to_s) do |x, n|
#     x[0...n] + x[n + 1..-1] + x[n]
#   end .to_i
# end

p max_rotation(735291)
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845