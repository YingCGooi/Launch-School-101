```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

#### LINE 1
- The multi-dimensional array `[[[1, 2], [3, 4]], [5, 6]]` calls the `Array#map` method
- Each inner array is passed to the outer block in turn and assigned to the local variable `arr`

#### LINE 2
- Each inner array `arr`: `[[1, 2], [3, 4]]`// `[5, 6]` in turn calls the `Array#map` method
- Each innermost array or inner-element is passed to the inner block in turn and assigned to the local variable `el`

#### LINE 3
- The `#to_s` and `#size` methods are called on `el`
- This returns `1` only if `el` is an integer
- The `if` statement checks if `el` is an integer

#### LINE 4
- If `el` is an integer, we add `1` to the integer value of `el`

#### LINE 5-6
- Otherwise, `el` calls the `Array#map` method
- Each innermost integer is passed to the innermost block in turn and assigned to the local variable `n`

#### LINE 7
- We add `1` to each innermost integer `n`
- Since this is the last evaluated statement in the block, the return value of the innermost block is `n + 1`

#### LINE 8
- At the end of innermost block execution, `map` includes each block return value into a new array
- The innermost `#map` returns `[3, 4]` and `[4, 5]` in each iteration respectively

#### LINE 9
- This is the end of `if` statement, also the last evaluated statement within the inner block
- The block return values of the inner block is then `[3, 4]`, `[4, 5]` and `6`, `7` in the first and second outer block iteration respectively

#### LINE 10
- At the end of inner block execution, `map` includes each block return values into a new array
- The inner `map` returns `[[3, 4], [4, 5]]` and `[6, 7]` in the first and second outer block iteration respectively
- Since this is the last evaluated statement within the outer block, the return values of the inner `map` is also the outer block's return value

#### LINE 11
- At the end of outer block execution, `map` includes each block return values into a new array
- The final resulting return value from outer `map` is `[[[2, 3], [4, 5]], [6, 7]]`