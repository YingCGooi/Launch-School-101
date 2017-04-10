# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# Input: two strings
# Output: shorterstring + longerstring + shorterstring

def short_long_short(string_1, string_2)
  if string_1.length < string_2.length
    shorter_string = string_1
    longer_string = string_2
  else
    shorter_string = string_2
    longer_string = string_1
  end
  shorter_string + longer_string + shorter_string
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end