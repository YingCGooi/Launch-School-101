# Write a method that can rotate the last n digits of a number. For example:

def rotate_array(array)
  first, *remainder = array
  [*remainder, first]
end

# def rotate_rightmost_digits(num, n_digits)
#   digit_arr = num.to_s.chars
#   rotated = rotate_array(digit_arr[-n_digits..-1])
#   first_digits = digit_arr[0, digit_arr.size - n_digits]
#   first_digits << rotated
#   first_digits.flatten.join.to_i
# end

def rotate_rightmost_digits(num, n)
  digit_arr = num.to_s.chars
  digit_arr[-n..-1] = rotate_array(digit_arr[-n..-1])
  digit_arr.join.to_i
end

p rotate_rightmost_digits(735291, 1)
p rotate_rightmost_digits(735291, 2)
p rotate_rightmost_digits(735291, 3)
p rotate_rightmost_digits(735291, 4)
p rotate_rightmost_digits(735291, 5)
p rotate_rightmost_digits(735291, 6)

# Note that rotating just 1 digit results in the original number being p returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

