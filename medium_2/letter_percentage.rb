# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.


def letter_percentages(string)
  hsh = { lowercase: 0, uppercase: 0, neither: 0}
  string.chars do |char|
    if char == char.downcase && /[A-Za-z]/ =~ char
      hsh[:lowercase] += 1 
    elsif char == char.upcase && /[A-Za-z]/ =~ char
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  total_values = hsh.values.reduce(:+)
  hsh.map do |key, value|
    [key, (value.to_f / total_values)*100]
  end .to_h
end

p letter_percentages('abCdef 123')  #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123')# == { lowercase: 0, uppercase: 0, neither: 100 }