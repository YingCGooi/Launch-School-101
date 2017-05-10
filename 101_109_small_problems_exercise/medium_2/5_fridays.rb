# # An interesting variation on this problem is to count the number of 5th Fridays, i.e., count the months that have 5 Fridays. This one is harder than it sounds since you must account for leap years.
require 'date'

def lucky_days(year)
  (1..12).select do |month|
    Date.new(year, month, 5).friday?
  end
end

p lucky_days(2008)
# p lucky_days(2012)
# p lucky_days(2015)
# p lucky_days(1986)
# p lucky_days(2019)
