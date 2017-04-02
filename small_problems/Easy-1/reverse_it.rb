# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

#input: a string with one or more words
#output: a string with the first word at the last position, last word at the first position, and so on.

# Test cases:
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

def reverse_sentence(string)
  string.split(" ").reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'