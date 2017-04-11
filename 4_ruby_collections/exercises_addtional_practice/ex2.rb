# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237}

sum_of_ages = 0
ages.each { |_, age| sum_of_ages += age }
p sum_of_ages

p ages.values.inject(:+) # apply the '+' operator to the accumulator and obj parameters of #inject