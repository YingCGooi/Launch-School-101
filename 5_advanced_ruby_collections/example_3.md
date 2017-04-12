```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]
```

| Line| Action | Object | Side Effect | Return Value | Is Return Value Used? |
|:---:| :----------------- | :---------- | :--- | :------------ | :------------ |
|  1  | Method Call (`map`)  | Outer Array | No   |
|  2  | Content Cell  |