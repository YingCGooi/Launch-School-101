# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world” # greeting gets initialized to nil even if the 'if' statement is not evaluated.
end

greeting # nil, because it is initialized in the if block, but usually raises an exception "undefined method or local variable"