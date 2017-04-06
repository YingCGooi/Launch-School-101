# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# input: 2 positive integers
# output: operations on those two numbers

puts('==> Enter the first number: ')
first_num = gets.chomp.to_i

puts('==> Enter the second number: ')
second_num = gets.chomp.to_i


puts("==> #{first_num} + #{second_num} = #{first_num + second_num}")
puts("==> #{first_num} - #{second_num} = #{first_num - second_num}")
puts("==> #{first_num} * #{second_num} = #{first_num * second_num}")
puts("==> #{first_num} / #{second_num} = #{first_num / second_num}")
puts("==> #{first_num} % #{second_num} = #{first_num % second_num}")
puts("==> #{first_num} ** #{second_num} = #{first_num ** second_num}")

