```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

## Analysis

#### LINE 1
The `Array#map` method is being called on the multi-dimensional array `[[1, 2], [3, 4]]`.
Each sub-array (`[1,2]` and `[3, 4]`) is passed to the block through the block argument `|arr|` and is assigned to the local variable `arr`.

#### LINE 2
The `Array#first` is called on `arr`.
This returns the first element of the object in each sub-array.
In this case, the integers `1` and `3`, respectively at each iteration.
The `puts` method outputs the string representation of `arr.first`, then returns `nil` at each iteration.
Since `puts` is the last line of the block, the block return value is `nil`.
The block return value `nil` at each iteration is included in the new collection since `Array#map` transforms each element in the original collection.

#### LINE 3
The block execution stops here. The return value of the `Array#map` method is a new collection containing all the transformed element. Since `nil` is always returned by the block and the block has gone through two iterations, the new collection will be `[nil, nil]`