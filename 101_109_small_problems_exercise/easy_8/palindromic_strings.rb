# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def substrings_at_start(string)
  (0..string.length - 1).map do |idx|
    string[0..idx]
  end
end

def substrings(string)
  (0..string.size).map do |idx|
    substrings_at_start(string[idx..-1])
  end .flatten
end

def palindromes(string)
  substrings(string).select do |word|
    word == word.reverse && word.length > 1
  end
end

def palindromes_non_special(string)
  substrings(string).select do |word|
    stripped = word.downcase.delete('^A-z')
    stripped == stripped.reverse && stripped.length > 1
  end
end

# p palindromes('abcd')
# p palindromes('madam')
# p palindromes('hello-madam-did-madam-goodbye')
# p palindromes('knitting cassettes')s

p palindromes_non_special('abcd')
p palindromes_non_special('madam')
p palindromes_non_special('hello-madam-did-madam-goodbye')
p palindromes_non_special('knitting cassettes')
p palindromes_non_special('A man, a plan, a canal, Panama!')

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]