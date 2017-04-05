# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
SQFEET_TO_SQMETERS = 1 / 10.7639
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.03

puts "Enter the length of the room in feet: "
feet_length = gets.chomp

puts "Enter the width of the room in feet: "
feet_width = gets.chomp

square_feet = (feet_length.to_f * feet_width.to_f).round(2)
square_inches = (square_feet * SQFEET_TO_SQINCHES).round(2)
square_cm = (square_feet * SQFEET_TO_SQCM).round(2)
puts "The area of the room is #{square_feet} square feet, or #{square_inches} square inches or #{square_cm} square centimeters."