## Selecting Different Objects in Nested Arrays

Lets's say that we are selecting integers that are greater than 13 or strings that are less than 6 characters, we can use the following implementation to achieve this:

```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
```


### Why `#map` instead of `#select` or `#each`?
`#select` here won't work since an outer `#select` will not have access to the inner elements of the nested array.

```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].select do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[8, 13, 27], ["apple", "banana", "cantaloupe"]]
```

The above example above shows that:
- the inner `#select` method will return new sub-arrays containing selected elements
- The new sub-arrays will become the block return values of the outer `#select`
- `#select` treats a truthy object to be `true`, therefore including the entire sub-array into the new collection

If we used `#each` instead, we will need an extra variable to collect the selected results.