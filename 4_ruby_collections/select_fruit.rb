produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_list)
  selected_fruits = {}
  count = 0

  loop do
    produce_key_array = produce_list.keys
    produce_key = produce_key_array[count]
    produce_value = produce_list[produce_key]
    selected_fruits[produce_key] = produce_value if produce_value == 'Fruit'
    count += 1
    break if count >= produce_key_array.size
  end


end

puts select_fruit(produce)