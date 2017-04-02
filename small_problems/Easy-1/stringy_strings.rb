# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

require 'pry'
# input:
# 1 postive integer
# output:
# string starting with 1, next char is 0, and then alternating 1s and 0s

# test cases:
# stringy(6) = "101010"
# stringy(9) = "101010101"

# method:
# we declare a new array
# integer.times do 
#  set iterator = 1
#  if the iterator is odd, insert '1' into the array
#   otherwise insert '0' into the array
# return the array

def stringy(integer, default=1)

  binaries = []

  if integer.to_i == integer && integer >= 0 # we test if integer is valid
    integer.times do |i|
      if default == 1
        binary = i.even? ? 1 : 0
      elsif default == 0
        binary = i.odd? ? 1 : 0
      end
      binaries << binary
    end
    binaries.join
  else
    nil # return nil if the input is not valid
  end
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0)
