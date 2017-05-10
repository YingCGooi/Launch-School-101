# Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

def egyptian(r_num)
  denominators = []
  acc = 0
  
  (1..999_999_999).each do |denom|
    next if acc + (1/denom.to_r) > r_num
    acc += 1/denom.to_r
    denominators << denom
    break if acc >= r_num
  end
  
  denominators
end

def unegyptian(arr)
  arr.inject(0) { |acc, denom| acc + 1/denom.to_r }
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
p egyptian(Rational(3, 4))

p unegyptian(egyptian(Rational(1, 2))) # == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) # == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)