# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year

# Input:
# A year
# Output criteria: TRUE or FALSE
# A year that is evenly divisble by 4, except a year that is divisible by 100.
# A year is evenly divisble by 400.
# Year has to be greater than 0.

def leap_year?(year)
  divisible_by_four_not_hundred(year) || divisble_by_four_hundred(year)
end

def divisible_by_four_not_hundred(year)
  (year % 4 == 0) && (year % 100 != 0)
end

def divisble_by_four_hundred(year)
  year % 400 == 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

def leap_year2?(year)
  if year % 4 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 400 == 0
  end
end # this will not work as any number that is divisible by 100 will also be divisible by 4, therefore the elsif condiiton is never evaluated.

p leap_year2?(2016) == true
p leap_year2?(2015) == false
p leap_year2?(2100) == false
p leap_year2?(2400) == true
p leap_year2?(240000) == true
p leap_year2?(240001) == false
p leap_year2?(2000) == true
p leap_year2?(1900) == false
p leap_year2?(1752) == true
p leap_year2?(1700) == false
p leap_year2?(1) == false
p leap_year2?(100) == false
p leap_year2?(400) == true