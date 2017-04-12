```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```
# 1
# 3
# => [[1, 2], [3, 4]]

## Breaking Down into Parts
#### LINE 1
The nested array [[1, 2], [3, 4]] which contains two array elements [1, 2] and [3, 4] is performing an action call - Array#each
The return value of this Array#each is the original collection - which is the nested array [[1, 2], [3, 4]]
Array#each ignores the block's return value.
#### LINE 1-3
After Array#each was called, we execute the block by first assing in a block argument `arr` in line 1.
The block argument `arr` represents each element in the original collection, in this case, each sub-array of the nested array: [1, 2] and [3, 4]. ([1, 2] will be passed in at the first iteration of the block execution, while [3, 4] will be assed in at the second iteration)
#### LINE 2
At line 2, we call the method Array#first on the variable `arr`. The variable `arr`'s scope is made available by the block argument. For each iteration in this case, `arr` refers to each sub-array of the original collection.
 At the first iteration of the block execution, `arr.first` is executed. It can be thought as executing `[1, 2].first`.
 `[1, 2].first` will return the first element (at index 0) in the array, in this case, `1`.
 The `Kernel#puts` or `puts` method now outputs the result of `arr.first`, which is `1`. Since `puts` will always return a `nil` value after it is called, the block return value is `nil`.
 The same block execution is performed for the second iteration.
 At the second iteration however, `puts arr.first` will output `3` since `3` is the first element of the sub-array `[3, 4]`


# What is the type of action being performed (method call, block, conditional, etc..)?
# What is the object that action is being performed on?
# What is the side-effect of that action (e.g. output or destructive action)?
# What is the return value of that action?
# Is the return value used by whatever instigated the action?