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
| 2        | `Array#each` method call              | Each sub-array for that iteration in the outer block                    | None                                                           | Sub-arrays (`[18,7]` or `[3,12]`) in current iteration                                     | Used as block return values of outer block           |
| 2-6      | Inner Block Execution                 | Each integer from each sub-array                                        | Outputs the integer if it is greater than 5                    | Block return value for every iteration is `nil`                                            | No usage                                             |
| 3        | `if` Conditional Expression           | Each element from each sub-array in that iteration                      | Only considers elements which are integers greater than 5      | Return value of next evaluated statements when condition is met, or `nil` if not evaluated | Used to determine inner block's return value         |
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



