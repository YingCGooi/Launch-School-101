# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

flintstones.index do |element| # Returns the index of the first object in ary such that the object is equivalent to obj.
  element[0, 2] == "Be"
end
