# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# def rotate_array(arr)
#   new_arr = arr.dup
#   new_arr << (new_arr.shift)
#   new_arr
# end
def rotate_array(array)
  first, *remainder = array
  [*remainder, first]
end

def rotate_integer(num)
  num_string = num.to_s
  (num_string[1..-1] + num_string[0]).to_i
end

def rotate_string(string)
  string[1..-1] + string[0]
end

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

p rotate_integer(65567)
p rotate_string('string')
p rotate_array([7, 3, 5, 2, 9, 1])
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true