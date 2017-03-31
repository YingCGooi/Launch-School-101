require 'pry'

# def car(new_car)
#   make = make(new_car)
#   model = model(new_car)
#   [make, model]
# end

# def make(new_car)
#   new_car.split('').first
# end

# def model(new_car)
#   new_car.split(' ').last
# end

# make, model = car('Ford Mustang') # multiple assignment
# # it makes the first element gets assigned to make,
# # the second element gets assigned to model
# make == "Ford" # => false


class Car
  attr_accessor :brand, :model

  def initialize(new_car)
    @brand = new_car.split(' ').first
    @model = new_car.split(' ').last
    # binding.pry     # <= execution will stop here
  end

end

betty = Car.new('Ford Mustang')
puts betty.model.start_with?('M')