# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Input: year
# Output: century number, ends with st, nd, rd or th

# Method
# First, we need to return the thousands and the hundreds place of the year. eg: 2000 becomes 20, 1900 becomes 19, 50 becomes 0.
# Next we define ordinals to all the numbers that end with (1,2,3) except 11th, 12th, and 13th.

def century_suffix(century_number)
  return "th" if [11,12,13].include?(century_number % 100)

  last_digit = century_number % 10
  ordinal_array = %w(th st nd rd th th th th th)
  ordinal_array[last_digit]
end

def century(year)
  century_number = (year + 99) / 100
  century_number.to_s + century_suffix(century_number)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'



