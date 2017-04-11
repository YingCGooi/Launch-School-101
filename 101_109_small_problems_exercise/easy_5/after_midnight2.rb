# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.
SECONDS_PER_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
SECONDS_PER_HOUR = SECONDS_PER_MINUTE * MINUTES_PER_HOUR

def after_midnight(string)
  hours, minutes = string.split(":").map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(string)
  (MINUTES_PER_DAY - after_midnight(string)) % MINUTES_PER_DAY
end

p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34')
p before_midnight('12:34')
p after_midnight('24:00')
p before_midnight('24:00')
p after_midnight('09:40')
p before_midnight('09:40')

def after_midnight_2(string)
  hours, minutes = string.split(":").map(&:to_i)
  time = Time.new(2017, 1, 1, hours, minutes)
  midnight_time = Time.new(2017, 1, 1)
  (time - midnight_time) / SECONDS_PER_MINUTE % MINUTES_PER_DAY
end

def before_midnight_2(string)
  hours, minutes = string.split(":").map(&:to_i)
  time = Time.new(2017, 1, 1, hours, minutes)
  midnight_time = Time.new(2017, 1, 1)
  (midnight_time - time) / SECONDS_PER_MINUTE % MINUTES_PER_DAY
end

p after_midnight_2('00:00')
p before_midnight_2('00:00')
p after_midnight_2('12:34')
p before_midnight_2('12:34')
p after_midnight_2('24:00')
p before_midnight_2('24:00')
p after_midnight_2('09:40')
p before_midnight_2('09:40')