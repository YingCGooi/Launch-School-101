# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

# output criteria: new array with identical structure, containing int % 3 == 0

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |sub_arr|
  sub_arr.select do |int|
    int % 3 == 0
  end
end