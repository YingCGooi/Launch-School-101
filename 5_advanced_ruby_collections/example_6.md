## Selecting Elements in an Array of Hashes
> ###### In here, we select every element where every key matches the first letter of the value

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

| **Line** | **Action**                              | **Calling Object**                                                       | **Side Effect /Console Output** | **Return Value**                                                   | **Return Value's Usage**                       |
| :---:    | :---------                              | :---------                                                               | :-----------------              | :------------------                                                | :-----------------------                       |
| 1        | `Array#select` method call              | Array of hashes: `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`           | None                            | New array of hashes `[{ :c => "cat" }]`                            | None                                           |
| 1-5      | `#select` block execution               | Each hash-element in the array `{a:'ant',b:'elephant'}`/ `{c:'cat'}`     | None                            | `false` for first hash, `true` for `{c:'cat'}`                     | Used by `#select` as selection criteria        |
| 2        | `Enumerable#all?` method call           | Hash at current `#select` block's iteration                              | None                            | `false` at first `#select` iteration, `true` at second iteration   | Determine `#select` block's return value       |
| 2-4      | `#all?` block execution                 | Each key-value pair in the hash at the current `#select` block iteration | None                            | `true` if key matches the first letter of value, `false` otherwise | Used by `#all?` to determine the final boolean |
| 3        | `value[0] == key.to_s` boolean operator | The key and value from each key-value pair                               | None                            | `true` if key matches the first letter of value, `false` otherwise | Determine `#all?` block's return value         |

### Analysis
In order to select the hashes where all of its keys matches the first letter of value,
we pass in an array of hashes to the `Array#select` method.

Each hash-element in the array is passed into the block through the block's argument `|hash|`.
Each hash-element for that current iteration of `#select` block is then called upon by the `Enumerable#all?` method to determine if it meets our selection criteria.
In the `#all?` block, each key-value pair is passed into the block through the block arguments `|key, value|`.
The key is assigned to the local variable `key`, while the value of the pair is assigned to the local variable `value`.

Next, in the last statement of `#all?` block execution,
we specify a boolean operation such that it will return `true` if `value[0]` (the first letter of the value) matches `key.to_s` (the string representation of key symbol).

Passing in the first hash-element, the key-value pairs `a: 'ant'` will evaluate the last statement of `#all?` block to `true` and `b: 'elephant'` will evaluate to `false`.
The last evaluated statement's value determines the block's return value.
`#all?` will return `true` only if the block passed to it never returns a value other than `true` for every key-value pair in the hash-element.
Since the second key-value pair in the hash-element returns a block value of `false`, the `#all?` method will return a value of `false`.

Passing in the second hash-element `{c: 'cat'}`, when this key-value pair is evaluated by the last statement of `#all?`, it returns a block value of `true`.
And since there are no other key-value pairs to be evaluated by the `#all?` block, no other block return values will be returned.
`#all?` method will then return a value of `true`, based on its only `true` block return value.

The `#select` block will now have block return values (evaluated from `#all?` method) of `false` at the first iteration and `true` at the second.
`#select` method will only select all the elements whose block return value evaluates to `true`, and in this case, the `{c: 'cat'}` hash-element.
The `{c: 'cat'}` element will be selected and included in the new array collection.

### What if we use `#any?` instead?
`Enumerable#any?` will return `true` if one or more of its block iterations returns a value of `true`,
thus ignoring any block return values of `false` or `nil`.
In this case, if `#any` is used instead of `#all?`, the first hash-element `{ a: 'ant', b: 'elephant' }` will return a value of `true` when called upon by `#any?`.
This is because while `{b: 'elephant'}` will result in a block return value of `false`, it is ignored as the first key-value pair `{a: 'ant'}` will result in a block return value of `true`.
Finally, `#select` will include both hash-elements into a new array since `#any?` returns `true` for both hash-elements as ``#select`'s block return values.
A new array `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]` will be returned as a result.
