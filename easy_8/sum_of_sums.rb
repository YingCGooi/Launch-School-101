# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# def sum_of_sums(arr)
#   sum_total = 0
#   arr.each_with_index do |num, idx|
#     sum_total += num * (arr.size - idx)
#   end
#   sum_totals
# end

def sum_of_sums(arr)
  sum_total = 0
  1.upto(arr.size) do |sub_arr_size|
    sum_total += arr.take(sub_arr_size).reduce(:+)
  end
  sum_total
end

p sum_of_sums([3, 5, 2])
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35