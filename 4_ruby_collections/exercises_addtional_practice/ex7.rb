# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

freq_hash =  {}

statement.delete(' ').split('').each_with_index do |char, index|
  freq_hash[char] = statement.split('').count(char)
end

p freq_hash

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# p result

"The Flintstones Rock".scan('t').count
# => 2
"The Flintstones Rock".scan('n').count
# => 2
"The Flintstones Rock".scan('r').count
# => 0