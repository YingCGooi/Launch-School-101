# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# input: two arrays
# return value: an array
# criteria: contains all the values from both arrays, duplicates are not allowed

# example: [1, 3, 5], [3, 6, 9]
# concat arr1 + arr2
# call uniq on the return value

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

# original solution
def original_merge(arr1, arr2)
  arr1 | arr2
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]