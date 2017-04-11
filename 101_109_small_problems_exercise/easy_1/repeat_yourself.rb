#Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(string, num)
	if num >= 0 && string.instance_of?(String)
		print (string + "\n") * num # we are adding a newline char here for every string printed
	else
		puts "Please make sure that you passed in a string and positive integer." #error handling
	end
end

repeat('Hello', 3)
repeat('Thank you', 19)
repeat('Error', -1)
repeat(43, 6)

