# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# Input: array of numbers
# Output: array with same number of elements, each element is a running total from original array

def running_total(array)
  array.inject([]) { |a, y| a << y + (a.last || 0) }
end

p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20])
p running_total([3])
p running_total([])
