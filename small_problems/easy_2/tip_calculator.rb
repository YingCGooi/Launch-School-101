# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What is the bill?"
bill = gets.chomp

puts "What is the tip %?"
percentage = gets.chomp
# format('%.2f', input)
tip = bill.to_f * percentage.to_f / 100
total = bill.to_f + tip.to_f

puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"