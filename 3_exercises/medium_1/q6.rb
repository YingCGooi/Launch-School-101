# In an earlier exercise we saw that depending on variables to be modified by called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # this is an assignment, we are reassigning a_string_param without mutating the original string object that the argument is referring to
  an_array_param << "rutabaga" # this is a mutation, we are appending an additional element "rutabaga" into an_array_param, changing the contents of an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

# How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?

def refactored_tricky_method(a_string_param, an_array_param)
  # p an_array_param.object_id
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  # p an_array_param.object_id
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# p my_array.object_id
refactored_tricky_method(my_string, my_array)
# p my_array.object_id

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"