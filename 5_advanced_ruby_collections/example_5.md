```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

| **Line** | **Action**              | **Calling Object**                                            | **Side Effect /Console Output** | **Return Value(s)**                                                        | **Return Value's Usage**                |
| :---:    | :---------              | :---------                                                    | :-----------------              | :------------------                                                        | :-----------------------                |
| 1        | `Array#map` method call | Array `[[1, 2], [3, 4]]`                                      | None                            | New array `[[2, 4], [6, 8]]`                                               | None                                    |
| 1-5      | Outer Block Execution   | Each sub-array: `[1,2]`/`[3,4]`                               | None                            | New sub-arrays: `[2, 4]` and `[6, 8]`                                      | Used by `#map` for transformation       |
| 2        | `Array#map` method call | Sub-array at current iteration of outer block                 | None                            | New sub-array at current iteration                                         | Determine block's return value          |
| 2-4      | Inner Block Execution   | Each element of sub-array at current iteration of outer block | None                            | `2`, `4` at first outer iteration and `6`, `8` at second outer iteration   | Used by inner `#map` for transformation |
| 3        | Multiplication          | Each integer in sub-array at current iteration of outer block | None                            | `num * 2`, where `num` is each integer at current iteration of inner block | Used as inner block's return value      |




