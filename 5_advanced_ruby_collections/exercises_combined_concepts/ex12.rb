# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

# output criteria: first element of the sub-array is the key, second element of the sub-array is the value of the new hash

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = {}
arr.each do |sub_arr|
  new_hash[sub_arr[0]] = sub_arr[1]
end
