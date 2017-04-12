```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

| Line| Action              | Object                 |Side Effect| Return Value  | Is Return Value Used? | Shown or Its Use? |
|:---:| :-----------------  | :----------            |:---       | :------------ | :------------ | :---------- |
|  1  | `Array#map` method call | `[[1, 2], [3, 4]]` | No        | New array `[1, 3]`| No | Shown on last line |
|  2  | `first` method call | Each sub-array         | No        | First element (at index 0) of sub-array | Yes | Used by `puts` |
|  2  | `puts` method call  | First element of each sub-array | Display the string representation of the object | `nil` | No | Outputs on 5th and 6th lines |
|  3  | `first` method call | Each sub-array         | No        | First element of sub-array | Yes | Used for block's return value |
|  4  | `end` stop execution| | | | | |
