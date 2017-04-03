words = %w(scooby doo on channel two)
words.each {|str| words.delete(str)}
puts words.inspect  