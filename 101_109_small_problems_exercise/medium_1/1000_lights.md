## Further Exploration

### Why do perfect squares keep the light on?

We know that perfect squares have even number of toggles after the first round. 
An even number of toggles on round 1 (which is ON), will return ON. We can illustrate this in a table form for the first 16 rounds:

| Switch                     | **01** | 02  | 03  | **04** | 05  | 06  | 07  | 08  | **09** | 10  | 11  | 12  | 13  | 14  | 15  | **16** |
| :---:                      | ---    | --- | --- | ---    | --- | --- | --- | --- | ---    | --- | --- | --- | --- | --- | --- | ---    |
| Rnd 1                      | **ON** | ON  | ON  | ON     | ON  | ON  | ON  | ON  | ON     | ON  | ON  | ON  | ON  | ON  | ON  | ON     |
| Rnd 2                      |        | OFF |     | OFF    |     | OFF |     | OFF |        | OFF |     | OFF |     | OFF |     | OFF    |
| Rnd 3                      |        |     | OFF |        |     | ON  |     |     | OFF    |     |     | ON  |     |     | OFF |        |
| Rnd 4                      |        |     |     | **ON** |     |     |     | ON  |        |     |     | OFF |     |     |     | ON     |
| Rnd 5                      |        |     |     |        | OFF |     |     |     |        | ON  |     |     |     |     | ON  |        |
| Rnd 6                      |        |     |     |        |     | OFF |     |     |        |     |     | ON  |     |     |     |        |
| Rnd 7                      |        |     |     |        |     |     | OFF |     |        |     |     |     |     | ON  |     |        |
| Rnd 8                      |        |     |     |        |     |     |     | OFF |        |     |     |     |     |     |     | OFF    |
| Rnd 9                      |        |     |     |        |     |     |     |     | **ON** |     |     |     |     |     |     |        |
| Rnd 10                     |        |     |     |        |     |     |     |     |        | OFF |     |     |     |     |     |        |
| Rnd 11                     |        |     |     |        |     |     |     |     |        |     | OFF |     |     |     |     |        |
| Rnd 12                     |        |     |     |        |     |     |     |     |        |     |     | OFF |     |     |     |        |
| Rnd 13                     |        |     |     |        |     |     |     |     |        |     |     |     | OFF |     |     |        |
| Rnd 14                     |        |     |     |        |     |     |     |     |        |     |     |     |     | OFF |     |        |
| Rnd 15                     |        |     |     |        |     |     |     |     |        |     |     |     |     |     | OFF |        |
| Rnd 16                     |        |     |     |        |     |     |     |     |        |     |     |     |     |     |     | **ON** |
| Num of Toggles after Rnd 1 | 0      | 1   | 1   | **2**  | 1   | 3   | 1   | 3   | **2**  | 3   | 1   | 5   | 1   | 3   | 3   | **4**  |

Any subsequent rounds will not have an effect on the previous switch where the switch is less than the round number.

### Using Array instead of Hashes

I first used recursion to iterate through each round, but later refactored it into a nested block instead. This way, it is easier to see what's going on.

```ruby
lights_arr = [false] * 1000
```
First, we initialize our array of lights `lights_arr`. We assign an array containing 1000 `false` booleans to it.
Each boolean element represent the state of the light (`true` is switched ON/ `false` is switched OFF)

```ruby
(1..1000).each do |round|
  lights_arr.map!.with_index do |light, light_num|
    (light_num + 1) % round == 0 ? !light : light
  end
end
```
Next, we call `Array#map!` on `lights_arr` so that we mutate our array of booleans with each iteration.
This way, we skip the hassle of reassigning `lights_arr` into another variable.

We also call `with_index` to identify which light number we are currently performing the switch.
Each boolean is passed into the `map!` block and in turn assigned to the block local variable `light`
Since we are iterating from index 0, we need to add 1 to our `light_num` to return the correct light number.
We can then determine if this light number is divisible by our round number, 
by calling `%` method on our current light number, passing in `round` as an argument and check if it returns 0 remainder value.
If our light number has 0 remainder value, it means that it is divisible by our current round number. Thus we toggle the light switch by calling `!` operator on `light` to switch the light. Otherwise, we return the same boolean `light` in the block.

Finally we call the `!map` method 1000 times through the outer `each` block, passing in each `round` number as the iterator. This will return an array of booleans, with each boolean represents the final ON/OFF state of the light.

```
p lights_arr
# => [true, false, false, true, false, false, false, false, true, ...]
```
We can then transform this array based on the truthiness of each element:

```ruby
lights_on =
  lights_arr.map.with_index do |light, light_num|
    (light_num + 1) if light
  end
```
We can do this by calling `Array#map` to perform the transformation.
We adjust our light number to be `light_num + 1` since our `light_num` starts from index 0 instead of 1.
If the light is ON (`true`), we return the light number as our block return value, otherwise the `if` statement is not run and will return `nil`.
`Array#map` then takes each block return value (a number or `nil`) and includes them into a new array.
We then assign the new array to a local variable `lights_on`.

```
p lights_on
# => [1, nil, nil, 4, nil, nil, nil, nil, 9...]
```

We can then call `Array#compact` to remove all the `nil` values to return our final array of light numbers which are ON.

```
p lights_on.compact
# => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
```





  



