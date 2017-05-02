# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

def substrings_at_start(string)
  (0..string.length - 1).map { |idx| string[0..idx] }
end

# def substrings_at_start(str)
#   str.size <= 1 ? [str] : [*substrings_at_start(str.chop), str]
# end

# def substrings_at_start(string, arr=[])
#   return arr if arr.size == string.size
#   arr << string[0..arr.size]
#   substrings_at_start(string, arr)
# end

p substrings_at_start('abc')
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']