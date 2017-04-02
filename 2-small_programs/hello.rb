def fix(value)
  puts "initial object #{value.object_id}"
  value << 'xyz'
  value = value.upcase
  puts "upcased object #{value.object_id}"
  value.concat('!')
  puts "concatinated object #{value.object_id}"
  value
end

s = 'hello'
puts "original object #{s} #{s.object_id}"
t = fix(s)
puts "final object #{t} #{t.object_id}"