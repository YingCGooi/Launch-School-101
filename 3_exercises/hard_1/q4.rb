# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a valid ip address number and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # => ['10', '4', '5', '11']
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true # this needs to be fixed as the method will always return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

def fixed_dot_separated_ip_address?(input_string) #10.4.5.11
  dot_separated_words = input_string.split(".") # => ['10', '4', '5', '11']
  dot_separated_words.size == 4 && (dot_separated_words == dot_separated_words.select { |x| is_an_ip_number?(x) }) # every element has to be a valid number in order for the block to return the original array. The second part of the condition will evaluate to true if every element in dot_separated_words is valid.
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end