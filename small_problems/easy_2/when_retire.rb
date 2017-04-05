# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

work_years_to_go = retire_age - current_age
retire_year = Time.now.year + work_years_to_go
puts "It's #{Time.now.year}. You will retire in #{retire_year}."
puts "You have only #{work_years_to_go} years of work to go!"