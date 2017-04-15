# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

def crunch(string)
  new_string = ''
  string.each_char do |char|
    new_string << char if new_string[-1] != char
  end
  new_string
end




p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# original solution
def original_crunch(text)
  index = 0
  crunch_text = ''
  while index < text.length
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

p original_crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p original_crunch('4444abcabccba') == '4abcabcba'
p original_crunch('ggggggggggggggg') == 'g'
p original_crunch('a') == 'a'
p original_crunch('') == ''

# with regex
def crunch(str)
  str.gsub!(/(.)(?=\1)/, '')
  str
end