# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(num1, num2)
  (num1..num2).each do |num|
    case
    when num % 5 == 0 && num % 3 == 0 then print "FizzBuzz"
    when num % 3 == 0                 then print "Fizz"
    when num % 5 == 0                 then print "Buzz"
    else print num
    end
    print ', ' if num < num2
  end
end

fizzbuzz(12, 32) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz