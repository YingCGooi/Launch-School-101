# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3 # only the second key-value pair evaluates to 'true'
    value # the block return value is 'bear'
  end
end # => [nil, "bear"]
# the return value of #map from a hash object is an array containing arrays of key-value pairs.
# the 'nil' came from the if statement.
# 'If' will return 'nil' if none of the conditions is evaluated. In this case, the if condition did not evaluate 'key', therefore block return value of 'key' is 'nil'.