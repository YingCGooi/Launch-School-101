# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."
# ...remove everything starting from "house".

p advice.slice(0, advice.index('house'))
# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

# the original advice array will not be mutated.

