# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

ENGLISH_WORDS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)

# Examples:
# [1,2,3,4,5,6]
def alphabetic_number_sort(number_arr)
  number_arr.sort_by do |int|
    ENGLISH_WORDS[int]
  end
end


p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

p alphabetic_number_sort([6, 7, 3, 9, 0])

# further exploration
def further_alphabetic_number_sort(number_arr)
  number_arr.sort do |a, b|
    ENGLISH_WORDS[a] <=> ENGLISH_WORDS[b]
  end
end

p further_alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

p further_alphabetic_number_sort([6, 7, 3, 9, 0])