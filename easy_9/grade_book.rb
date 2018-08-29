# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter  Grade
# 90 <= score <= 100  'A'
# 80 <= score < 90  'B'
# 70 <= score < 80  'C'
# 60 <= score < 70  'D'
# 0 <= score < 60 'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# def get_grade(num1, num2, num3, extra_credit = 0)
#   result = (num1 + num2 + num3) / 3

#   case result
#   when 90..(100 + extra_credit) then 'A'
#   when 80...90 then 'B'
#   when 70...80 then 'C'
#   when 60...70 then 'D'
#   else              'F'
#   end
# end

def get_grade(*num)
  case num.reduce(:+) / num.count
  when 90...Float::INFINITY then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end


p get_grade(105, 103, 102) == "A"
p get_grade(50, 50, 95) == "D"