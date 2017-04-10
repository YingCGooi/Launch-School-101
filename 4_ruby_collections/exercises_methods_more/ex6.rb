# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size
# => 11
# pop destructively removes and returns the last element , which is 'caterpillar'. And then since we call the #size method on the return value by #pop, it will return the object's number of characters, which in this case is a String object.