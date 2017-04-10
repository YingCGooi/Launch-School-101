# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1 # the second and third elements will evaluate to true here.
    puts num # the block return value here is 'nil'
  else
    num # the block return value here is the number itself
  end
end # => [1, nil, nil]
# map returns a new collection containing transformed object. In this case, the first element cause the if condition to evaluate to false, which means the block's return value is num (the element itself). For the rest of the elements in the array, 2 > 1 and 3 > 1 evaluates to true, which means that the last expressions for those iterations are 'puts num', such that the block return value is 'nil'.
