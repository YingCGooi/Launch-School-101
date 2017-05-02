```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```


| **Line** | **Action**                            | **Object**                                                              | **Side Effect / Console Output**                               | **Return Value(s)**                                                                        | **Return Value's Usage**                             |
| :---:    | :---------                            | :---------                                                              | :-------------------------------                               | :------------------                                                                        | :-----------------------                             |
| 1        | Assignment to outer variable `my_arr` | None                                                                    | None                                                           | `[[18, 7], [3, 12]]`                                                                       | None                                                 |
| 1        | `Array#each` method call              | Array `[[18, 7], [3, 12]]`                                              | None                                                           | Original Array: `[[18, 7], [3, 12]]`                                                       | Used for assignment to outer local variable `my_arr` |
| 1-7      | Outer Block Execution                 | Each sub-array `[18,7]` and `[3,12]`                                    | None                                                           | Each sub-array                                                                             | No usage                                             |
| 2        | `Array#each` method call              | Each sub-array for that iteration in the outer block                    | None                                                           | Sub-arrays (`[18,7]` or `[3,12]`) for that current iteration                               | Used as block return values of outer block           |
| 2-6      | Inner Block Execution                 | Each integer from each sub-array                                        | Outputs the integer if it is greater than 5                    | Block return value for every iteration is `nil`                                            | No usage                                             |
| 3        | `if` Conditional statement            | Each element from each sub-array in that iteration                      | Only considers elements which are integers greater than 5      | Return value of next evaluated statements when condition is met, or `nil` if not evaluated | Used to determine inner block's return value         |
| 4        | `puts` method call                    | Integers from each sub-array in that iteration which are greater than 5 | Outputs the string representation of integers `18`, `7`and`12` | `nil`                                                                                      | Used as inner block's return value                   |
| 5        | End of `if` condition execution       | None                                                                    | None                                                           | None                                                                                       | None                                                 |
| 6        | End of inner block execution          | None                                                                    | None                                                           | None                                                                                       | None                                                 |
| 7        | End of outer block execution          | None                                                                    | None                                                           | None                                                                                       | None                                                 |

### Output
Each sub-array (`[18,7]` and `[3,12]` respectively) is passed into the inner `each` block.
In the inner block, each element in each sub-array at that iteration is evaluated through the `if` statement.
When the element is an integer greater than 5, the `if` statement evaluates to true and that integer is output as a string representation to the console by calling `puts`.

```ruby
# => 18
# => 7
# => 12
# => [[18, 7], [3, 12]]
```

### Value of `my_arr`
`Array#each` ignores the block's return value and return the original object called upon.
In this case, the value of `my_arr` will be the original calling object, which is the array `[[18, 7], [3, 12]]`.


### LINE 1
`Array#each` is being called on an Array object that contains two nested inner arrays `[[18, 7], [3, 12]]`
Each inner array is passed into the block through the block parameter `arr`, and in turn,
assigned to the local variable `arr`

### LINE 2
`Array#each` is being called on `arr`: `[18, 7]` and `[3, 12]` in each iteration respecitively.
Each element in the inner array is passed into the inner block through the block parameter `num`,
and in turn, assigned to the local variable `num`

### LINE 3
An `if` statement is run to perform a comparison between `num` and 5, if `num` is greater than `5`,
The next statement will be executed

### LINE 4
If `num` (each element in the inner array) is more than `5`. `puts` is called on `num`.
`puts` will output a string representation of the integer and return `nil`. 
If the `if` condition is not met, `nil` is also returned.
Since this is the last evaluated statement within the inner block, the return value of 
the inner block is `nil` for every iteration.

### LINES 2-6
Each does not do anything with the inner block's return value.
Since the return value of each is the calling object,
in this case, `arr` is the calling object and ultimately returned to the outer block.
Since this is the last evaluated statement within the outer block, `arr` is the block's return value.

### LINES 1-7
Each ignores the outer block's return value.
Since the return value of each is the calling object,
in this case, the original array `[[18, 7], [3, 12]]` is returned.

### LINE 1 
The local variable is initialized to the original collection returned by `each`
