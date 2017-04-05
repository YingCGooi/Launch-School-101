# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + "#{40 + 2}"

# Why is this and what are two possible ways to fix this?

'puts is invoked and can only display the number if the entire argument is fixnum. Here we have a string in front of the fixnum (40 + 2), so when we try to concatenate both using '+', Ruby will not allow it (concatenation of a string and a fixnum object is not allowed).'
'we use string interpolation "#{}" to fix it.'