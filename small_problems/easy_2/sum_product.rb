# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
def prompt(message)
  puts(">> #{message}")
end

def valid_number?(number)
  number.to_i.to_s == number && number.to_i > 0
end

def valid_answer?(answer)
  %w(s p).include?(answer.downcase)
end

def sum_or_product(answer)
  if answer.downcase == 's'
    "sum"
  elsif answer.downcase == 'p'
    "product"
  end
end

def compute_sum(number)
  (1..number).reduce(:+)
  # 1.upto(number) { |value| sum += value }
end

def compute_product(number)
  (1..number).reduce(:*)
  # 1.upto(number) { |value| product *= value }
end

def result(number, answer)
  if answer.downcase == 's'
    compute_sum(number.to_i)
  elsif answer.downcase == 'p'
    compute_product(number.to_i)
  else
    nil
  end
end

number = ''
answer = ''
loop do
  loop do
    prompt("Please enter an integer greater than 0: ")
    number = gets.chomp
    break if valid_number?(number)
  end

  loop do
    prompt("Enter 's' to compute the sum, 'p' to compute the product.")
    answer = gets.chomp
    break if valid_answer?(answer)
  end

  sum_or_product = sum_or_product(answer)
  result = result(number, answer)

  prompt("The #{sum_or_product} of the integers between 1 and #{number} is #{result}")

  puts("\n\n")
end

