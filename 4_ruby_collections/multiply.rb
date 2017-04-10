def multiply(number_array, multiple)
  count = 0
  multiplied_array = []

  loop do
    break if count >= number_array.size
    multiplied_array << number_array[count] * multiple
    count += 1
  end

  multiplied_array
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)
