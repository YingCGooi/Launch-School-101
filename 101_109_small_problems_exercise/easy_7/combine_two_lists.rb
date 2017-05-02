# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.


def interleave(array1, array2)
  new_array = []
  (0..(array1.size - 1)).each do |index|
    new_array << array1[index]
    new_array << array2[index]
  end
  new_array
end

def zip_interleave(array1, array2)
  array1.zip(array2).flatten
end


p interleave([1, 2, 3], ['a', 'b', 'c'])
p zip_interleave([1, 2, 3], ['a', 'b', 'c'])