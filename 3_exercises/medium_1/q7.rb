# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8 # this is reassignment
end

new_answer = mess_with_it(answer)

p answer - 8
# will print 34 since the variable 'answer' was not mutated