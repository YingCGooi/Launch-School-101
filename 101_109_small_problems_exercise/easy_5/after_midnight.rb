# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.
# You may not use ruby's Date and Time classes.

# Examples:
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def time_of_day(minute_offset)
  format('%02d:%02d', hour(minute_offset), minute(minute_offset))
end

def hour(minute_offset) # we use -4231 as example here
  hours_offset = minute_offset / MINUTES_PER_HOUR
  # -4231 / 60 => -71 hours offset
  days_offset = hours_offset / HOURS_PER_DAY
  # -71 / 24 => -3 days offset
  hours_offset - (days_offset * HOURS_PER_DAY)
  # -71 hours offset - (-3 * 24) => +1 hour offset from 00:00 (3 days ago)
end

def minute(minute_offset) # we use -4231 as example here
  minute_offset % MINUTES_PER_HOUR # -4231 % 60 => +29 minutes offset
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Further exploration
DAY = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

def time_of_day_2(minute_offset)
  seconds_offset = minute_offset * 60
  time = Time.new(2017, 1, 1) # DAY[wday] => 'Sunday'
  (time + seconds_offset).strftime("%H:%M (%A)")
end

p time_of_day_2(0)
p time_of_day_2(-3)
p time_of_day_2(35)
p time_of_day_2(-1437)
p time_of_day_2(3000)
p time_of_day_2(800)
p time_of_day_2(-4231)