# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(array)
  odd_elements = []
  array.each_with_index do |x, i|
    odd_elements << x if i.even?
  end
  odd_elements
end

def evenities(array)
  even_elements = array.select.with_index { |x, i| i.odd? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []
