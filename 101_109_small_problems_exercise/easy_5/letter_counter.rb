# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# Input: string with one more space separated words
# Output: a Hash which key is the number of letters, which value is the number of words that has belongs to its respective number of letters

# Method:
# Split the string into array of words
# Create a new array of number of letters
# For each word, count the size of the word
# Count the number of words which has the same size
# Insert the size of the word as a key in the hash
# Insert the number of words as value in the hash


def word_sizes(string)
  letter_count_hash = {}

  word_sizes = string.split.map { |word| word.size }
  word_sizes.each { |size| letter_count_hash[size] = word_sizes.count(size) }

  letter_count_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle,   the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}


def word_sizes_2(words_string) #original solution
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end