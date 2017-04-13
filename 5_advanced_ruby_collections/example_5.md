```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]
```

| **Line** | **Action**               | **Calling Object**                                            | **Side Effect /Console Output** | **Return Value**                                                         | **Return Value's Usage**                |
| :---:    | :---------               | :---------                                                    | :-----------------              | :------------------                                                      | :-----------------------                |
| 1        | `Array#map` method call  | Array `[[1, 2], [3, 4]]`                                      | None                            | New array `[[2, 4], [6, 8]]`                                             | None                                    |
| 1-5      | Outer Block Execution    | Each sub-array: `[1,2]`/`[3,4]`                               | None                            | New sub-array at current iteration: `[2, 4]`/ `[6, 8]`                   | Used by outer `#map` for transformation |
| 2        | `Array#map` method call  | Sub-array at current iteration of outer block                 | None                            | New sub-array at current iteration                                       | Determine outer block's return value    |
| 2-4      | Inner Block Execution    | Each element of sub-array at current iteration of outer block | None                            | `2`, `4` at first outer iteration and `6`, `8` at second outer iteration | Used by inner `#map` for transformation |
| 3        | Multiplication `num * 2` | Each integer in sub-array at current iteration of outer block | None                            | An integer twice the original value                                      | Determine inner block's return value    |


### Return Values and Analysis
When the original array `[[1, 2], [3, 4]]` is passed into the outer `#map` block, at each iteration each sub-array is passed into the inner `#map` block.
Each element in the sub-array at the current outer block iteration is then passed into the inner block through the block argument `|num|`,
and subsequently assigned to inner local variable `num`.
At the last evaluated statement of the inner block, `num * 2` will return an integer value that is twice the integer value of the original element.
This return value is the inner block's return value at the current inner block's iteration.

At the end of the inner block's execution, a new array will be returned by the inner `#map` containing all of the transformed elements in the sub-array at the current outer block's iteration.
In other words, the inner `#map` will return `[2, 4]` at the first outer block iteration and `[6, 8]` at the second iteration.
Since the inner block is the last evaluated statement of the outer block,
the return values of the inner `#map` are `[2, 4]`, `[6, 8]` respectively and will be used to determine the outer block's return values.
The outer `#map` will use those return values and perform a transformation, returning a new array `[[2, 4], [6, 8]]`.


