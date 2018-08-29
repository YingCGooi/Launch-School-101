# Using an if/else statement, run a loop that prints "The loop was processed!" one time if process_the_loop equals true. Print "The loop wasn't processed!" if process_the_loop equals false.


process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end

# process_the_loop will be assigned randomly to either true or false
# we run loop only if process_the_loop evaluates to true.
# we can use an if/else statement to accomplish this task
# to run a loop a prints "The loop was processed" once, we simply add a break immediately following puts inside loop.
# We don't need to have sort of counter variable in this case becase we only need to print the string once.
# Then all we need to do is place puts "The loop wasn't processed!" in the else clause.