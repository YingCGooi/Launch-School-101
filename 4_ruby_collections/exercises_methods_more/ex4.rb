# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash| # a hash object is passed in as an argument, where at the end of iteration the hash will be returned by the method.
  hash[value[0]] = value # the hash object is modified here
end # => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'} now it contains three key-value pairs.