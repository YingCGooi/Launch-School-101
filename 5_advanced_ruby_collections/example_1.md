```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

## Analysis

#### LINE 1
The nested array `[[1, 2], [3, 4]]` which contains two array elements `[1, 2]`and `[3, 4]` is performing an action call - `Array#each`.
The return value of `Array#each` is the original collection - which is the nested array `[[1, 2], [3, 4]]`.
`Array#each` ignores the block's return value.

#### LINE 1-3
After `Array#each` was called, we specify a block argument `arr` in line 1.
Each element in the original collection (in this case each sub-array sub-array of the nested array: `[1, 2]` and `[3, 4]`.) is passed into the block through the block argument `arr`. The local variable `arr` is now made available.
`[1, 2]` will be passed in at the first iteration of the block execution, while `[3, 4]` will be passed in at the second iteration.

#### LINE 2
At line 2, we call the method `Array#first` on the variable `arr`. The variable `arr`'s scope is made available through the block argument. For each iteration, `arr` refers to each element of the original collection. In this case, each sub-array element.

At the first iteration of the block execution, `arr.first`  can be thought as executing `[1, 2].first`. The operation will return the first element (at index 0) in the sub-array, in this case `1`.

Then, the `puts` method now outputs the result of `arr.first`, which is `1`. Since `puts` will always return a `nil` value after it is called, the block return value will always be `nil`.

The same block execution is performed for the second iteration.
At the second iteration however, `puts arr.first` will output `3`. This is because `3` is returned by `arr.first` which can be thought as peforming `[3, 4].first`.

#### LINE 3
The `end` syntax determines the end of the block execution. Since `Array#each` ignores the block's return value, the return value of `Array#each` is the original collection `[[1, 2], [3, 4]]`.