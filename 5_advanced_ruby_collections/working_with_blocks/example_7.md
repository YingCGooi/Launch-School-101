## Sorting Nested Arrays

For example, we want to sort an array of nested arrays so that the inner arrays are ordered according to their strings' numeric values.

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
```

If we call `sort` on this array, it returns:

```ruby
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
```

In here, the string order determines the nested arrays' order.
Strings are compared 'element-wise', meaning that the strings at index 0 of each array are compared against each other first,
and then the strings at index 1 of each array are compared next. Strings are compared until the last element of each array.

Since strings are compared character by character, an unwanted result is produced.
For example, if we try to compare a one-character numeric string with a two-character numeric string:

```
irb(main):001:0> "11" <=> "9"
=> -1
irb(main):002:0> "12" <=> "6"
=> -1
```

In this case, `'11'` precedes `'9'` and `'12'` precedes `'6`. Since strings are compared using `String#<=>` instead of a numeric comparison `Fixnum#<=>`, only the first character of each string is compared against each other if one of the strings has only one character. This is not we wanted.

In order to perform a numeric-wise comparison between each strings, we need to:
- transform the strings in the nested arrays into integers prior to performing comparison and sorting
- make sure that we do not mutate the original array by using any destructive methods, as to ensure all original elements will be returned

```ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

The implementation above uses `Array#sort_by` instead of `Array#sort`. This way, we can better specify the criteria by which the comparison will take place.
Since `sort_by` takes a block as the comparison criteria, we can further call `Array#map` on each `sub_arr`.
We then call `num.to_i` to transform every string element in the `sub_arr` into integers at the current `sub_arr` iteration.
Subsequently, `Array#map` will transform each sub-array and returns a new array containing only integers at each iteration, leaving the original sub-array unmodified. The `Array#sort_by` will then compare and sort its block return values (which is now the new sub-arrays that contain only integers) at each iteration, while returning a sorted array containing the same original array-elements. We have safely sorted the strings numerically without any side effects.