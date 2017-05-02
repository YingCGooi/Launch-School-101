# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split[-2]
end

def mid_word(string, offset_right = false)
  word_arr = string.split
  return word_arr[word_arr.size / 2] if offset_right
  word_arr[(word_arr.size / 2.0).ceil - 1]
end

p penultimate('last word')
# == 'last'
p penultimate('Launch School is great!')
# == 'is'

p mid_word('Launch School is great!')
p mid_word('key')
p mid_word('Launch School will teach good fundamental programming skills.')
p mid_word('Launch School teaches good fundamental programming skills.')

