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

  digits.each { |digit| number = 10 * number + digit }
  number
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then string_to_integer(string[1..-1]) * (-1)
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100