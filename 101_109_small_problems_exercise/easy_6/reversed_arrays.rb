# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed in to this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# input: array containing elements
# output: the same array object, with elements reversed
# criteria: we can't use Array#reverse or Array#Reverse!

# arr = [1, 2, 3, 4, 5]
# arr[0], arr[4] = arr[4], arr[0]
# arr[1], arr[3] = arr[3], arr[1]
# number_of_iterations = arr.size / 2
# from i = 0 to (arr.size / 2) - 1
# arr[i], arr[arr.size - i] = arr[arr.size - i], arr[i]
require 'pry'

def reverse!(arr)
  last_index = arr.size - 1
  for i in (0..((arr.size/2) - 1))
    arr[i], arr[last_index - i] = arr[last_index - i], arr[i]
  end
  arr
end

list = [1,2,3,4]
p result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []