def doubled_numbers!(numbers)
  count = 0

  loop do
    break if count >= numbers.size
    numbers[count] *= 2 # mutable objects are passed by reference
    # numbers[count] is reassigned to another integer, but the original array did not change
    count += 1
  end

  numbers # this array contains elements that are referring to different integer objects than original integer objects
end

my_numbers = [1, 4, 3, 7, 2, 6]
p doubled_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers