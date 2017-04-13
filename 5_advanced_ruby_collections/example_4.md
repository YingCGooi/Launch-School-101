```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```


| **Line** | **Action**                            | **Object**                                            | **Side Effect / Console Output**                          | **Return Value(s)**                                                | **Return Value's Usage**                  |
| 1        | Assignment to outer variable `my_arr` | Original array from `#each`: `[[18, 7], [3, 12]]`     | None                                                      | None                                                               | None                                      |
| 1        | `Array#each` method call              | Array `[[18, 7], [3, 12]]`                            | `Array#each` will return original collection              | Original Array                                                     | Assigned to outer local variable `my_arr` |
| 1-7      | Block Execution                       | Each sub-array `[18,7]`/`[3,12]`                      | None                                                      | Sub-arrays `[18,7]` and `[3,12]` respectively                      | No usage                                  |
| 2        | `Array#each` method call              | Each sub-array `[18,7]`/`[3,12]`                      | None                                                      | Original Sub-arrays                                                | As block return values of the outer block |
| 2-6      | Inner Block Execution                 | Each integer from each sub-array                      | Outputs the integer if it is greater than 5               | Block return value for every iteration is `nil`                    | No usage                                  |
| 3        | Conditional Expression                | Each element from each sub-array                      | Only considers elements which are integers greater than 5 | Return value of next evaluated statements when condition is `true` | Used to determine block's return value    |
| 4        | `puts` method call                    | Integers from each sub-array which are greater than 5 | Outputs the string representation of the integer          | `nil`                                                              | Used as block's return value              |
| 5        | End of `if` condition execution       | None                                                  | None                                                      | None                                                               | None                                      |
| 6        | End of inner block execution          | None                                                  | None                                                      | None                                                               | None                                      |
| 7        | End of outer block execution          | None                                                  | None                                                      | None                                                               | None                                      |


