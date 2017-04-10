# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code. What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd? # => true if the element 'num' is a odd number # => false if it is a even number
end # => returns 'true', since at least one of the element evaluates to 'true' in the block's return value

# additional notes:
# The return value of the block is the return value of the last line within the block. In this case the last statement is num.odd? a boolean.
# Array#any? method returns 'true' if the block ever retuns a truthy value.
# Interesting points: any? stops iterating after the first iteration since num.odd? evaluates to 'true' in the first iteration. Thus, 'puts num' is only invoked for the first element 1 in the array.