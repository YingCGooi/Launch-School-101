### Understanding Minilang-written Math Expressions

This post is intended to provide a walk-through to better understand how we can write math expressions in terms of minilang. I would like to share my approach here on tackling the Further Exploration section in 101-109 Medium 1 Exercise on Stack Machine Interpretation.

In minilang, numbers are passed into the stack program in reversed order. The stack program operates such that:

1. The latter value is first pushed to the stack
2. The former value is assigned to the register
3. The register pops the latter value from the stack and performs an operation with its value
4. The return value of the register can then be used to repeat the process from 1 for multiple values

#### Single operation
____

```ruby
2 - 1
```

The above example performs a math operation of 'subtracting 1 from 2'. In other words, we can say that we first push `1` into the stack and assign `2` to the register, and then use `SUB` to pop `1` from the stack and perform the subtraction with the register value of `2`.

Basically, we write the numbers in reverse order followed by the operation: `1 PUSH 2 SUB`. Finally, we print the return value of the register.

```ruby
# 2 - 1 can be written as:
minilang('1 PUSH 2 SUB PRINT') 
# => 1
```

#### Multiple operations
_____

```ruby
4 - 3 * 2 + 1 
```

The above example shows multiple operations being performed. There is a simple way to write this:

1. Write the numbers in reversed order with 'PUSH' in between
2. Write the remaining operations in order
3. PRINT the return value of the register

The reason for the above steps is the same: we push the latter values into the stack before performing the operations in order. Following the above steps


1. `1 PUSH 2 PUSH 3 PUSH 4`
2. `SUB MULT ADD`
3. `PRINT`


And finally...

```ruby
# 4 - 3 * 2 + 1 can be written as:
minilang('1 PUSH 2 PUSH 3 PUSH 4 SUB MULT ADD PRINT')
# => 3
```

We can see that the stack program evaluates the expression correctly from the order of left to right: `4 - 3 == 1`; `1 * 2 == 2`; and `2 + 1 == 3`. 

What if we want to prioritize MULT `*` to take place before the remaining operations?

#### Expressions with parentheses
_____

Here, we specify precedence of operation by using `()`. Operations within `()` gets performed first before the rest.

```ruby
4 - (3 * 2) + 1
```

This is a little tricky, but the simple rule applies: we first write the numbers in reversed order with 'PUSH' in between:
```ruby
1 PUSH 2 PUSH 3 PUSH 4
```
Since we want MULT `*` to take precedence towards the order of operation, we simply insert MULT right after the value designated to perform that operation.
```ruby
1 PUSH 2 PUSH 3 *MULT* PUSH 4
```
Then, we write the remaining operations in order:

```ruby
1 PUSH 2 PUSH 3 MULT PUSH 4 *SUB* *ADD*
```

Finally, we PRINT the return value of the register:

```ruby
# 4 - (3 * 2) + 1 can be written as
minilang('1 PUSH 2 PUSH 3 MULT PUSH 4 SUB ADD PRINT')
# => -1
```

The above correctly evaluates our expression with the order of operations within the `()` being performed first: `(3 * 2) == 6`; `4 - 6 == -2`; and `-2 + 1 == -1`

#### A more complex example

> source: LaunchSchool 101-109 Small Problems Medium 1 exercise
_____

```ruby
(3 + (4 * 5) - 7) / (5 % 3)
```

Using the tools we have previously, we determine that:

- The numbers in order are: `3, 4, 5, 7, 5, 3`
- In inner `()`, `4` will perform `*`
- In outer `()`s, `3` will perform `+, -`;  `5` will perform `%`
- Outer operation: `/`

we can write the above in minilang easily following the steps:

1. Write all the numbers in reverse order, with 'PUSH' in between
```ruby
3 PUSH 5 PUSH 7 PUSH 5 PUSH 4 PUSH 3
```

2. Insert the operation right after the value to be performed within the inner `()`
```ruby
3 PUSH 5 PUSH 7 PUSH 5 PUSH 4 *MULT* PUSH 3
```

3. Insert operations within outer `()`, skipping the ones in inner `()`
```ruby
3 PUSH 5 *MOD* PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 *ADD* *SUB*
```

4. Append the remaining outer operations
```ruby
3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB *DIV*
```

5. Finally, PRINT the return value of the register
```ruby
# (3 + (4 * 5) - 7) / (5 % 3) can be written as:
minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PUSH PRINT')
# => 8
```

The next step is to write a code to implement our steps above so that we can return a string containing all the commands necessary to evaluate our expression.

### Final solution code

```ruby
OPERATOR = {
  '+' => 'ADD ',
  '-' => 'SUB ',
  '*' => 'MULT ',
  '/' => 'DIV ',
  '%' => 'MOD '
}.freeze

def minilang_math(expression)
  minilang_str = ''
  buffers = [[]]
  current = 0
  expression.delete(' ').reverse.chars do |command|

    case command
    when '+', '-', '*', '/', '%'
      buffers[current] << OPERATOR[command]
      minilang_str << 'PUSH '

    when ')'
      current += 1
      buffers[current] = []

    when '('
      buffers[current].size.times { minilang_str << buffers[current].pop }
      current -= 1

    else
      if command.to_i.to_s != command
        break puts "INVALID COMMAND '#{command}' DETECTED"
      end
      minilang_str << "#{command} "
    end

  end
  buffers[0].size.times { minilang_str << buffers[current].pop }

  minilang_str << 'PRINT'
  p minilang_str

  minilang(minilang_str)
end

minilang_math('(3 + (4 * 5) - 7) / (5 % 3)')
# => "3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT"
# => 8
```

Let's break down my solution into parts:

On **line 1**, we create a new hash `OPERATOR` which the keys are the character representation of math operations and values are the words which we will pass in to our `minilang` method.

On **lines 9-10**, in our `minilang_math` method, we define it such that it takes a string as an argument. We initialize the final `minilang_str` to an empty string.

On **line 11**, we initialize a `buffer` variable to a nested array. This buffer will store the operation key words at each level enclosed by parentheses and pops the operation key words to our `minilang_str` whenever a parenthesis closes. For example, `buffer[0]` will store all the operation key words that are present in the outermost level; `buffer[1]` will store all the operation key words in the outer `()` level, and so on. The following diagram illustrates the how operator key words are stored in `buffer`
```
(a + (b * c) - d) / (e % f)
...|    |    |    ^----|----> stored to buffer[0] - outer level
...L----|----^---------^----> stored to buffer[1] - (in outer parentheses)
........L-------------------> stored to buffer[2] - (in inner parentheses)
```

On **line 12**, our `current` variable will keep track of at which level of parentheses we are currently working with.

On **line 13**, since a minilang evaluates a math expression backwards, we call `String#reverse` on the original expression, removing all empty characters and iterate through them by calling `String#chars` and `Array#each`.

#### An algorithmic approach

On **line 16**, reading from the last character of the expression, when our command is an operator (`+ - * / %`), we will append the command-word representation of that operator into our buffer at its current level. We also write the command `PUSH` onto our `minilang_str` so that we include the previous register value into the stack in order to save it for operation later.

On **lines 20-22**, when our command is `')'` (opening of parenthesis, since our expression is reversed), we create a new level in our `buffer` by incrementing `current` by `1`. We initialize `buffer[current]` to an empty array `[]`.

On **lines 24-26**, when our command is `'('` (closing of parenthesis), we will write all the operation key words within that level of buffer onto `minilang_str` in order, by calling `Array#pop` until our current level of buffer is empty.

On **lines 29-32**, lastly, we check if the command is an integer. We use a simple integer validation calling `to_i.to_s` and check if the return value is the same as original value. If it is an integer, we write the number onto `minilang_str`, otherwise we will print out an error message

On **line 36**, once we have done iterating through every character/ command in our reversed expression, we append the remaining operations stored in outermost level of our buffer onto `minilang_str`

On **line 38**, finally, we write the final command `PRINT` onto `minilang_str`. We can then pass this string to our `minilang` method for evaluation.

To further break it down, we can see how our `minilang_str` is being written at each iteration. We will call `puts` before the `end` keyword in our `each` block, printing out our current command, current buffer level, the buffer array and `minilang_str` at each iteration:

```ruby
buffers_align = buffers.to_s.ljust(35)
puts " #{command} | #{current} | #{buffers_align} | '#{minilang_str}'"
```

```
command | level | buffer array               | minilang_str
 ) | 1 | [[], []]                            | ''
 3 | 1 | [[], []]                            | '3 '
 % | 1 | [[], ["MOD "]]                      | '3 PUSH '
 5 | 1 | [[], ["MOD "]]                      | '3 PUSH 5 '
 ( | 0 | [[], []]                            | '3 PUSH 5 MOD '
 / | 0 | [["DIV "], []]                      | '3 PUSH 5 MOD PUSH '
 ) | 1 | [["DIV "], []]                      | '3 PUSH 5 MOD PUSH '
 7 | 1 | [["DIV "], []]                      | '3 PUSH 5 MOD PUSH 7 '
 - | 1 | [["DIV "], ["SUB "]]                | '3 PUSH 5 MOD PUSH 7 PUSH '
 ) | 2 | [["DIV "], ["SUB "], []]            | '3 PUSH 5 MOD PUSH 7 PUSH '
 5 | 2 | [["DIV "], ["SUB "], []]            | '3 PUSH 5 MOD PUSH 7 PUSH 5 '
 * | 2 | [["DIV "], ["SUB "], ["MULT "]]     | '3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH '
 4 | 2 | [["DIV "], ["SUB "], ["MULT "]]     | '3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 '
 ( | 1 | [["DIV "], ["SUB "], []]            | '3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT '
 + | 1 | [["DIV "], ["SUB ", "ADD "], []]    | '3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH '
 3 | 1 | [["DIV "], ["SUB ", "ADD "], []]    | '3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 '
 ( | 0 | [["DIV "], [], []]                  | '3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB '
 ```

