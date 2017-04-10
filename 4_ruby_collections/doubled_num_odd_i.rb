def doubled_num_odd_indices(number)
  count = 0
  doubled_num_if_i_odd = []

  loop do
    break if count >= number.size
    if count.odd?
      doubled_num_if_i_odd << number[count] * 2
    else
      doubled_num_if_i_odd << number[count]
    end

    count += 1
  end

  doubled_num_if_i_odd
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p doubled_num_odd_indices(my_numbers)
