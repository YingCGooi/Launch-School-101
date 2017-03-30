#Write a method that takes one argument in the form of an integer or a float; this argument may be either positive or negative. This method should check if a number is odd, returning true if its absolute value is odd. You may assume that only integers are passed in as arguments.

#Inputs: any number or decimal, positive or negative
#Output: true if absolute value is odd

def is_odd?(num)
	num.abs.remainder(2) != 0
end

puts is_odd?(2)   
puts is_odd?(5.25)   
puts is_odd?(-17.6) 
puts is_odd?(-8)  