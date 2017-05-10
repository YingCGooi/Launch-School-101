# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.


def bubble_sort!(arr)
  n = arr.size
  loop do
    new_n = 0
    (arr.size - 1).times do |idx|
      if (arr[idx] <=> arr[idx + 1]) == 1
        arr[idx], arr[idx + 1], new_n = arr[idx + 1], arr[idx], idx 
      end
    end
    break arr if new_n == 0
  end
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)