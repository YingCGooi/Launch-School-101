```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

| Line| Action              | Object                 |Side Effect / Console Output| Return Value  | Return Value's Usage |
|:---:| :-----------------  | :----------            |:---       | :------------ | :------------ |
|  1  | `Array#map` method call | `[[1, 2], [3, 4]]` | No | New array `[1, 3]`| No usage |
|  2  | `first` method call | Each sub-array         | No     | First element (at index 0) of sub-array | Used by `puts` |
|  2  | `puts` method call  | First element of each sub-array | Output string representation of the object (shown on 5th and 6th lines) | `nil` | No usage |
|  3  | `first` method call | Each sub-array         | No       | First element of sub-array | Block's return value |
