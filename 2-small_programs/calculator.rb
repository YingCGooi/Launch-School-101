# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
num1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
num2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = num1.to_i() + num2.to_i() #if condition does not create a block, therefore the variable created in if is visible outside the if condition
elsif operator == '2'
  result = num1.to_i() - num2.to_i()
elsif operator == '3'
  result = num1.to_i() * num2.to_i()
else
  result = num1.to_f() / num2.to_f()                 
end

Kernel.puts("The result is #{result}")