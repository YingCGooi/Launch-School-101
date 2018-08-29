# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

p CONSONANTS = ('A'..'Z').to_a - %w(A E I O U)

# def double_consonants(string)
#   string.chars.map do |char|
#     char.downcase =~ /[a-z^aeiou]/ ? char * 2 : char
#   end .join
# end

def double_consonants(string)
  string.chars.map do |char|
    CONSONANTS.include?(char.upcase) ? char << char : char
  end .join
end
p double_consonants('String')
p double_consonants("Hello-World!")
p double_consonants("July 4th")
p double_consonants('') == ""