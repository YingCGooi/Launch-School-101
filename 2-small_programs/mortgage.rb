# mortgage.rb

# a simple mortgage calculator to calculate monthly payments

require 'pry'
require 'yaml'
LANG = 'en'
MSG = YAML.load_file('mortgage_msg.yml')

# Prompt user for inputs:
# loan_amount
# annual_interest_rate = APR
# year = n/12 = loan duration in years

# Then we convert some of the inputs into:
# monthly interest rate = APR/12
# loan_duration_months = loan_duration_years*12

# Using the PV annuity formula,
# we calculate and output the monthly_payment to the user

def prompt(msg) # using a shorthand parser notation here
  puts("=> #{MSG[LANG][msg]}")
end

def output(msg) # another output style excluding the newline
  print("  => #{MSG[LANG][msg]}")
end

def integer?(num)
  num.to_i.to_s == num && num.to_i >= 0
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def valid_number?(num)
  integer?(num) || float?(num)
end

# START
prompt("WELCOME")

loop do
  loan_amount = "" # loan amount
  annual_int_rate = "" # APR
  year = "" # loan duration in years
  n = nil # loan duration in months = yr * 12
  monthly_int_rate = nil # monthly interest rate = i / 12

  loop do # prompt user input for the loan amount
    prompt("LOAN_INPUT")
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    prompt("VALID_NUM")
  end

  loop do # prompt user input for APR
    prompt("APR_INPUT")
    annual_int_rate = gets.chomp
    break if valid_number?(annual_int_rate)
    prompt("VALID_NUM")
  end

  loop do
    prompt("YEAR_INPUT")
    year = gets.chomp
    break if valid_number?(year)
    prompt("VALID_NUM")
  end

  annual_int_rate = annual_int_rate.to_f / 100 # convert % into decimal
  monthly_int_rate = annual_int_rate / 12 # calculate the monthly interest rate
  
  n = year.to_f * 12 # calculate the duration in months

  monthly_payment = loan_amount.to_f * (monthly_int_rate / (1 - (1 + monthly_int_rate)**-n)) # now we run the magic formula

  prompt("GIVEN_INPUT")
  output("P")
  print("$#{format('%.2f', loan_amount)}\n")
  output("I")
  print("#{annual_int_rate * 100}%\n")
  output("YR")
  print("#{year} years\n")

  prompt("OUTPUT")
  puts("  => $#{format('%.2f', monthly_payment)} per month")

  prompt("REPEAT?")
  answer = gets.chomp
  system 'clear'
  break unless %w(y yes yup ya yep).include?(answer.downcase)

end

prompt("THANK_YOU")
