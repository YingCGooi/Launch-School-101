# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# Input: string that contains words and non-alphabetic characters.
# Output: string with all the original non-alphabetic characters replaced by spaces.
# Output criteria: if more than one non-alphabetic characters appear in a row, make it only one space instead of multiple spaces in a row.

def cleanup(string)
  string.gsub(/[^A-Z,^a-z]+/,' ')
end

p cleanup("---what's my +*& line?")

ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
def cleanup_2(string)
  result = string.chars.map { |char| ALPHABET.include?(char) ? char : ' ' }
  result.join.squeeze(' ')
end

p cleanup_2("---what's my +*& line?")





