# Write a method that takes an integer, and converts it to a string representation.
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']


def integer_to_string(int)
  string_array = []
  loop do
    string_array.unshift(DIGITS[int % 10])
    int = int / 10
    break if int == 0
  end
  string_array.join
end

def signed_integer_to_string(number)
  ['', '+', '-'][number <=> 0] + integer_to_string(number.abs)
end
# the "spaceship <=>" operator compares the left side against the right side. Returns +1 if left side is greater than right, -1 if left side is smaller than right

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)


