# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# def balanced?(string)
#   parens = string.delete('^()')
#   parens.size.even? && parens[0] != ')' && parens[-1] != '('
# end

# def balanced?(string)
#   parens = 0
#   string.each_char do |char|
#     parens += 1 if char == '('
#     parens -= 1 if char == ')'
#     break if parens < 0
#   end

#   parens.zero?
# end

def balanced?(str)
  pattern = /\(\)|\[\]|\{\}|""|''/
  p str.gsub!(/(?<=\w)'(?=\w)/, '')
  p str.delete!('^()[]{}"\'')
  p str.gsub!(pattern, '') while str[pattern]
  str.empty?
end

p balanced?("What [(]is) the 'rocket's' name?") == false
p balanced?('What is) this?') == false
p balanced?('What {is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?(']What ((is)) up') == false
# Note that balanced pairs must each start with a (, not a ).