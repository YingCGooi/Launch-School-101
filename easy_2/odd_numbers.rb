# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

def odd_numbers(int1, int2)
  (int1..int2).select { |x| x.odd? }
end

puts odd_numbers(1, 99)