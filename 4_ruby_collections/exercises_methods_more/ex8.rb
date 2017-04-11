# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2) #=> [1, 2]

# Take returns the first n elements from an array, where n is the number specified in the #take method's argument.
# Take is non-destructive
# we can use irb to determine if a method is destructive.

arr.drop(3) #=> [4, 5]
# drop returns the remaining elements after the first n elements have been dropped.

