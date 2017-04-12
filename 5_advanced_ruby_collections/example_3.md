```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

| Line| Action              | Object                 |Side Effect / Output| Return Value  | Return Value's Usage |
|:---:| :-----------------  | :----------            |:---       | :------------ | :------------ |
|  1  | `Array#map` method call | `[[1, 2], [3, 4]]` | - | New array `[1, 3]`| - |
|  2  | `first` method call | Each sub-array         | -        | First element (at index 0) of sub-array | Used by `puts` |
|  2  | `puts` method call  | First element of each sub-array | Output string representation of the object (shown on 5th and 6th lines) | `nil` | - |
|  3  | `first` method call | Each sub-array         | -        | First element of sub-array | Block's return value |
