# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi' # => truthy
end # => return value is [1, 2, 3] since the #select method evaluates the last line 'hi'. Since 'hi' always returns a 'truthy' value, all the elements are selected. The original collection is returned.

