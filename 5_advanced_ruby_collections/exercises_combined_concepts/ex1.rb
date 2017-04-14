# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# First we need to iterate through each element and transform them into integers
# Next we sort these integer values in reverse, while returning the original number strings

arr.sort_by do |x|
  - x.to_i
end
# => ["11", "10", "9", "8", "7"]


# original solution:
arr.sort do |a,b|
  b.to_i <=> a.to_i # we switch the order to sort in reverse
end
# => ["11", "10", "9", "8", "7"]