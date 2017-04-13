```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

| **Line** | **Action**              | **Calling Object**              | **Side Effect / Console Output** | **Return Value(s)**                                               | **Return Value's Usage**          |
| :---:    | :---------              | :---------                      | :------------------------------- | :------------------                                               | :-----------------------          |
| 1        | `Array#map` method call | Array `[[1, 2], [3, 4]]`        | None                             | New array `[]`                                                    | None                              |
| 1-5      | Outer Block Execution   | Each sub-array: `[1,2]`/`[3,4]` | None                             | New sub-arrays: `[2, 4]`; `[6, 8]` depending on current iteration | Used by `#map` for transformation |
| 2        | `Array#map` method call | Sub-array at current iteration  | None                             | New sub-array at current iteration                                | Determine block's return value    |


