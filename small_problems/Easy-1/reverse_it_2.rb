# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# input criteria: 
# A string containing one or more words

# output criteria:
# if the string has >= 5 letters, reverse the word
# separate each word with spaces

# method:
# - split the string into words
# - loop through each words
# - if the word has >= 5 letters, reverse the letters in that word
# - return the result

def reverse_words(string)
  string.split(" ")
  words = string.split.map do |x|
                            if x.length >= 5
                              x.reverse
                            else
                              x
                            end
                          end
  words.join(" ")
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
