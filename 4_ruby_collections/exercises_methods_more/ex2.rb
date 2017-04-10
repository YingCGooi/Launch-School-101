# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4 # counts the number of elements for which the block yields a true value. In this case, only 'ant' and 'bat' character lengths less than 4. Count considers the 'truthiness' of the block's return value.
end # => 2

