# mortgage.rb

# a simple mortgage calculator to calculate monthly payments

require 'pry'
require 'yaml'
LANG = 'en'
MSG = YAML.load_file('mortgage_msg.yml')

# Prompt user for inputs:
# p = the loan amount
# i = APR
# yr = n/12 = loan duration in years

# Then we convert some of the inputs into:
# monthly interest rate (j) = APR/12 = i/12
# loan_duration_months (n) = loan_duration_years*12 = y * 12

# Using the PV annuity formula,
# we calculate and output the monthly payment (m) to the user

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
  p = "" # loan amount
  i = "" # APR
  yr = "" # loan duration in years
  n = nil # loan duration in months = yr * 12
  j = nil # monthly interest rate = i / 12

  loop do # prompt user input for the loan amount
    prompt("LOAN_INPUT")
    p = gets.chomp

    if valid_number?(p)
      p = p.to_f
      break
    else
      prompt("VALID_NUM")
    end
  end

  loop do # prompt user input for APR
    prompt("APR_INPUT")
    apr = gets.chomp

    if valid_number?(apr)
      i = apr.to_f / 100 # convert % into decimal
      j = i / 12 # calculate the monthly interest rate
      break
    else
      prompt("VALID_NUM")
    end
  end

  loop do
    prompt("YEAR_INPUT")
    yr = gets.chomp

    if valid_number?(yr)
      yr = yr.to_f
      n = yr * 12 # calculate the duration in months
      break
    else
      prompt("VALID_NUM")
    end
  end

  m = p * (j / (1 - (1 + j)**-n)) # now we run the magic formula

  prompt("GIVEN_INPUT")
  output("P")
  print("$#{format('%.2f', p)}\n")
  output("I")
  print("#{i * 100}%\n")
  output("YR")
  print("#{yr} years\n")

  prompt("OUTPUT")
  puts("  => $#{format('%.2f', m)} per month")

  prompt("REPEAT?")
  answer = gets.chomp
  break unless %w(y yes yup ya yep).include?(answer.downcase)
end

prompt("THANK_YOU")
