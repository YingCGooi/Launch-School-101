# What is the result of the last line in the code below?

greetings = { a: 'hi' } # initialize a local variable that refers to a hash containing a symbol. The symbol refers to the value (string object) 'hi'
informal_greeting = greetings[:a] # => 'hi'
# we assign a new local variable informal_greeting. This local variable now referes to the string object 'hi'
informal_greeting << ' there'
# we mutate the string object 'hi' to 'hi there' by using the << method. Since informal_greeting is a reference to the string object 'hi', the string object gets mutated. If we do not wish to mutate the original string object, we can use '+=' (string concat reassignment) instead of "<<"

puts informal_greeting  #  => "hi there"
puts greetings # => { a: 'hi there'}