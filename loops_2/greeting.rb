# Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting()
  number_of_greetings -= 1
end

# we want to call the `greeting` method two times.
# To do this, we will make our conditional evaluate to true until number_of_greetings is less than `1`. We control the value of `number_of_greetings` by subtracting `1` on each iteration. Lastly, to print 'Hello!' we invoke `greeting` method.