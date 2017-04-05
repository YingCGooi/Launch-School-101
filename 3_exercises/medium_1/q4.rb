# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Tests using IRB:
irb(main):015:0> buffer = []
=> []
irb(main):018:0> rolling_buffer1(buffer, 3, "I")
=> ["I"]
irb(main):019:0> rolling_buffer1(buffer, 3, "love")
=> ["I", "love"]
irb(main):020:0> rolling_buffer1(buffer, 3, "you")
=> ["I", "love", "you"]
irb(main):021:0> rolling_buffer1(buffer, 3, "too")
=> ["love", "you", "too"]

irb(main):022:0> input_array = []
=> []
irb(main):023:0> rolling_buffer2(input_array, 3, "I")
=> ["I"]
irb(main):024:0> rolling_buffer2(input_array, 3, "love")
=> ["love"]
irb(main):025:0> rolling_buffer2(input_array, 3, "you")
=> ["you"]
irb(main):026:0> rolling_buffer2(input_array, 3, "too")
=> ["too"]

'Yes there is a difference. rolling_buffer1 will change the buffer input argument after each call. rolling_buffer2 will not alter the input_array argument after each call, leaving the array that was passed into input_array the same.'