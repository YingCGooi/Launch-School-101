# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value } # copies all the reference from array1 to array2
# now both array contains the same String objects
# if you modify one of those Strings, modification will show up in both arrays
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2