# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_int and Integer behave similarly. In this exercise, you are going to create your own conversion method.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.
DIGITS = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }

def string_to_integer(number_string)
  number = 0
  digits = number_string.chars.map { |char| DIGITS[char] }

  # number_string.split('').each_with_index do |char, index|
  #   integer = DIGITS[char]
  #   length = number_string.length
  #   number += integer*(10**(length - index - 1))
  # end

  digits.each { |digit| number = 10 * number + digit}
  number
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570