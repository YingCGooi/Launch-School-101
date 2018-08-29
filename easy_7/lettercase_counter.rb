# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def letter_case_count(string)
  hsh = {lowercase: 0, uppercase: 0, neither: 0}
  string.each_char do |char|
    if char == char.downcase && ALPHABETS.include?(char)
      hsh[:lowercase] += 1
    elsif char == char.upcase && ALPHABETS.include?(char)
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')

# original solution
def original_letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

p original_letter_case_count('abCdef 123')
p original_letter_case_count('AbCd +Ef')
p original_letter_case_count('123')
p original_letter_case_count('')
