# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

def swapcase(string)
  string.split('').map do |char|
    char == char.upcase ? char.downcase : char.upcase
  end .join
end

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')