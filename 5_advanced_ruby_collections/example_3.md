```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

| Line| Action | Object   |Side Effect / Console Output| Return Value  | Return Value's Usage |
|:---:| :-----------------  | :----------            |:---   | :------------ | :------------ |
|  1  | `Array#map` method call | `[[1, 2], [3, 4]]` | No | New array `[1, 3]`| No usage |
|  2  | `first` method call | Each sub-array         | No   | First element (at index 0) of sub-array | Used by `puts` |
|  2  | `puts` method call  | First element of each sub-array | Output string representation of the object (shown on 5th and 6th lines) | `nil` | No usage |
|  3  | `first` method call | Each sub-array         | No   | First element of sub-array | Block's return value |

## Detailed Breakdown

#### LINE 1
The `Array#map` method is being called on the multi-dimensional array `[[1, 2], [3, 4]]`.
Each sub-array elements (`[1, 2]` and `[3, 4]` in this case) is passed into the block. Since we specify `|arr|` as the block argument, each sub-array elements will be assigned to the local variable `arr` iteratively.

#### LINE 2
The method `#first` is being called on each sub-array element through the local variable `arr`. This method will return the element at index 0 of each sub-array. In this case, `arr.first` will return `1` at the first iteration and `3` at the second iteration.

We then invoke `puts` on the return value of `arr.first`. Through each block iteration, `puts` will output the string representation of `1` and `3` (in this case, integer-to-string conversion is performed) to the console. `puts` will always return a value of `nil`. We can disregard this for now since `puts` is not evaluated at the last line of the block.

#### LINE 3
We then re-invoke `first` on the local variable `arr` at the last line of the block. Based on the previous evaluation of `arr.first`, we can expect the same values to be returned, which is `1` and `3` respectively. Since this is the last evaluated statement within the block, the block return values are `1` and `3`.

#### LINES 1 & 4
`end` designates the previous line as the last evaluated statement. Since the last evaluated statement returns block return values of `1` and `3`, the two integers are then included to a new array object by the transformation feature of `Array#map`. The return value of the `Array#map` method in this case is `[1, 3]`.