# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
def prompt_numbers(count)
  puts("==> Enter the #{counter(count)} number: ")
end

def counter(count)
  case count
    when 1 then '1st'
    when 2 then '2nd'
    when 3 then '3rd'
    when 4 then '4th'
    when 5 then '5th'
    when 6 then 'last'
  end
end

def valid_num?(number)
  number.to_i.to_s == number
end


num_array = []
number = ''

for i in (1..6)
  loop do
    prompt_numbers(i)
    number = gets.chomp
    break if valid_num?(number)
    puts("Please enter a valid number.")
  end
  num_array << number.to_i
end

if num_array.take(5).include?(num_array[5])
  result_string = "appears"
else
  result_string = "does not appear"
end

puts("The number #{num_array[5]} #{result_string} in #{num_array.take(5)}.")