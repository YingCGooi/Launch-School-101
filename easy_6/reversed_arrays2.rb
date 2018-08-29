# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# input: an array
# return value criteria: all the elements in the new array are reversed from the original

# use a loop
# example: arr = [1,2,3,4]
# new_arr[0] = arr[-1]
# new_arr[1] = arr[-2]
# ...
# for i in (1..arr.size)
# new_arr[i - 1] = arr[-i]
# return new_arr

# def reverse(arr)
#   new_arr = []
#   for i in (1..arr.size)
#     new_arr[i - 1] = arr[-i]
#   end
#   new_arr
# end

def reverse(arr)
  arr.each_with_object([]) {|x, new_arr| new_arr.unshift(x) }
end

p reverse([1,2,3,4])


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true


# original solution
def original_reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end