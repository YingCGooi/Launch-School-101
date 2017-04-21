# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# input: an array
# return value: two arrays nested in a new array
# criteria: first nested array will contain first half of the elements
#           second nested array will contain second half of the elements
# edge case: if original array has odd number of elements, middle element in the first nested array


# arr = [1, 2, 3, 4, 5]
# second_arr_size = arr.size / 2 = 2
# first_arr_size = arr.size - second_arr.size
# second_arr will contain the last (arr.size/ 2) elements
# first_arr will contain the remaining elements
# Array#take method to take a certain number of elements from the beginning

def halvsies(arr)
  second_arr_size = arr.size / 2
  first_arr_size = arr.size - second_arr_size
  first_arr = arr.take(first_arr_size)
  second_arr = arr - first_arr

  [first_arr, second_arr]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 1, 4, 3]) == [[1, 5, 1], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# original solution
def original_halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end