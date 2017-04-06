# Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param) # both parameters are treated the same way, Ruby passes the parameter "by value" as a reference to some object
  a_string_param += "rutabaga" # initialize a new local variable a_string_param (this is reassignment, creates a new string object) now this local variable points to "pumpkinsrutabaga"
  # - a_string_param and my_string no longer points to the same object
  an_array_param << "rutabaga" # initialize a new array local variable named 'an_array_param' (we attach the element "rutabaga" to the array, Ruby keeps using the same object that was passed in and appends the new element "rutabaga" to it)
  # they only live within the scope of the method definition
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => "pumpkins"
puts "My array looks like this now: #{my_array}" # => ["pumpkins", "rutabaga"]