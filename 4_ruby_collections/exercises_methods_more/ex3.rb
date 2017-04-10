# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num # => nil
end # the return will be [1, 2, 3] Since 'nil' is falsey, #reject will return a new collection that contains all the elements where their block return values are 'falsey' (false or nil).



