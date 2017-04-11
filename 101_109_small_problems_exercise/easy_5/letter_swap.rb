# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# input: a string of words separated by spaces
# output: a string of words which first and last letters are swaped

# assumptions: every word has at least one letter, string always contain at least one word. Only contains words and spaces

def swap(string)
  string.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end .join(' ')
end



p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')

# Example: let's say word is "what"
def swap_first_last_characters(a, b) # we pass in the arguments a as word[0], which is the first letter of "what" -- "w" and argument b as word[-1], which is the last letter of "what" -- "t"
  a, b = b, a # this exchange the values of a and b, in this case, it exchanges the values of the first letter and last letter in the word.
  # => the return value is an array containing the last original element first and first original element last. Since the modified 'word' is not specified as return value, the method will return ["t", "w"] instead of the word "thaw"
end

swap_first_last_characters(word[0], word[-1])
