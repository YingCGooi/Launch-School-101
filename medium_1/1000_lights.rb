# You have a bank of switches before you numbered from 1 to 1000. Each switch is connected to exactly one light that is initially off. You walk down the row of switches, and turn every one of them on. Then, you go back to the beginning and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and so on, and keep going until you have been through 1000 repetitions of this process.

# Write a program that determines which lights are on at the end.

# Example with 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.

# first_round = [true] * 1000

# second_round = first_round.map.with_index { |x, i| (i+1) % 2 == 0 ? !x : x }

# third_round = second_round.map.with_index { |x, i| (i+1) % 3 == 0 ? !x : x }

# fourth_round = third_round.map.with_index { |x, i| (i+1) % 4 == 0 ? !x : x }

# MAX_ROUND = 1000

# def switch_lights(round)
#   if round == 1
#     [true] * MAX_ROUND # initialize all lights to be on
#   else
#     switch_lights(round - 1).map.with_index do |switch, i|
#       (i + 1) % round == 0 ? !switch : switch
#     end
#   end
# end

# lights_on =
#   switch_lights(MAX_ROUND).map.with_index do |switch, i|
#     (i + 1) if switch == true
#   end .compact # remove nil values

# p lights_on
def num_arr(arr, on)
  return arr.map.with_index { |light, light_num| (light_num + 1) if light }.compact if on
  arr.map.with_index { |light, light_num| (light_num + 1) if !light }.compact
end

def display_lights(arr, on = true)
  *first_n, last = num_arr(arr, on)
  first_n.join(', ') + " and #{last}"
end

def output_result(arr, round)
  if round > 1
    print "Round #{round}: "
    print "Lights #{display_lights(arr, false)} are now off; "
    print "#{display_lights(arr)} are on"
    puts ""
  else
    print "Round 1: Every light is turned on"
    puts ""
  end
end

lights_arr = [false] * 10

(1..10).each do |round|
  lights_arr.map!.with_index do |light, light_num|
    (light_num + 1) % round == 0 ? !light : light
  end
  output_result(lights_arr, round)
end

p lights_arr

lights_on =
  lights_arr.map.with_index do |light, light_num|
    (light_num + 1) if light
  end

p lights_on.compact