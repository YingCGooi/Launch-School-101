# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

def reversed_number(int)
  int.to_s.reverse.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21
p reversed_number(1) == 1