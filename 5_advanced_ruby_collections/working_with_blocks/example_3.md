```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

|**Line**| **Action** | **Object** |**Side Effect / Console Output**| **Return Value**  | **Return Value's Usage** |
|:---:| :-----------------  | :----------            |:---   | :------------ | :------------ |
|  1  | `Array#map` method call | `[[1, 2], [3, 4]]` | None | New array `[1, 3]`| No usage |
|  2  | `first` method call | Each sub-array: `[1, 2]`,`[3, 4]` | None   | Integer at index 0 of sub-array | Used by `puts` |
|  2  | `puts` method call  | First element of each sub-array | Output string representation of the integer (shown on 5th and 6th lines) | `nil` | No usage |
|  3  | `first` method call | Each sub-array: `[1, 2]`,`[3, 4]` | None  | Integer at index 0 of sub-array | As block's return value |
| 1-4 | Block Execution | Each sub-array | None | Integers `1` and `3` returned from the method call `first` | Used by `Array#map` for transformation |

## Detailed Breakdown

#### LINE 1
The `Array#map` method is being called on the multi-dimensional array `[[1, 2], [3, 4]]`.
Each sub-array elements (in this case `[1, 2]` and `[3, 4]`) is passed into the block. Since we specify `|arr|` as the block's argument, each sub-array elements will be assigned to the local variable `arr` iteratively.

#### LINE 2
The method `#first` is being called on each sub-array element through the local variable `arr`. This method will return the element at index 0 of each sub-array. In this case, `arr.first` will return `1` (called from the sub-array `[1, 2]`) at the first iteration and `3`(called from the sub-array `[3, 4]`) at the second iteration.

We then invoke `puts` on the return value of `arr.first`. Through each block iteration, `puts` will output the string representation of integers `1` and `3` to the console. In this case, an integer-to-string conversion is performed before the output. `puts` will also return a value of `nil`. We can disregard this since `puts` is not evaluated at the last statement of the block.

#### LINE 3
We then re-invoke `first` on the local variable `arr` at the last line of the block execution. Based on the previous evaluation of `arr.first` on line 2, we can expect the same values to be returned, which are `1` and `3` respectively. Since `arr.first` is the last evaluated statement within the block, `arr.first`'s return value will be the block's return value.

#### LINES 1 & 4
`end` designates the previous line as the last evaluated statement. Since the last evaluated statement `arr.first`returns block return values of `1` and `3`, these two integers are included in a new array object by the transformation feature of `Array#map`. Thus, the return value of the `Array#map` method in this case is `[1, 3]`.