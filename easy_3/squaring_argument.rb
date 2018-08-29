# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Further exploration test cases:
# i = 2 ==> multiply(num,num)
# i = 3 ==> num * multiply(num, num)
# i = 4 ==> nultiply(num, num) * multiply(num, num)

def power(num, i)
  return 1 if i == 0
  multiply(num, power(num, i - 1))
end

def multiply(num1, num2)
  num1 * num2
end

p power(5, 2)
p power(-3, 3)
p power(2, 10)