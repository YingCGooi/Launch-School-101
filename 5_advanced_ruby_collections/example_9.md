```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```

### Analysis

## LINE 1:
`Array#map` method is being called by the triple-level array.
Then, we pass in each second-level-array `[[1], [2], [3], [4]]`/ `[['a'], ['b'], ['c']]` to `#map`'s block and we assign it to the local variable `element1` for that current iteration.

## LINE 2:
`Array#each` method is being called by the second-level-array at the current `#map` block iteration.
Then, we pass in the third-level-arrays `[1]`, `[2]`, `[3]`, `[4]` at the first `#map` block iteration and `['a']`, `['b']`, `['c']` at the second `#map` block iteration.
Each third-level-arrays are then assigned to the local variable `element2` based on that current iteration.

## LINE 3:
`Array#partition` method is being called by the third-level-arrays.
At the current iteration of `#each` block, we pass in each element in the third-level arrays and assign it to the local variable `element3`.

## LINES 3-5:
`Array#partition` will then split the third-level-arrays into an array of nested arrays: the first nested array containing all `elements3` (elements in the third-level-array) which evaluates to `true` in the block return value; the second nested array containing all `elements3` that evaluates to `false` in the block return value. We specify the `true` condition to be met if the `element3`'s size is greater than 0. In this case, every `element3` will meet the condition.

## LINES 2-6:
While the `#partition` method returns nested arrays that will become the `each`'s block return values,`Array#each` will ignore all block return values and return the original calling object (each second-level-array)

## LINES 1-7:
`Array#map` will take the original second-level-arrays and include them into a new array. The new array now has the exact same elements and order of the original triple-level array.




