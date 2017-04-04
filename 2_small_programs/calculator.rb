require 'pry'
require 'yaml'
LANG = 'en'
MSG = YAML.load_file('calc_msg.yml')

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def messages(msg, lang='en')
  MSG[lang][msg]
end

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_msg(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end

  word
end

prompt(messages('welcome',LANG))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?
    prompt(messages('valid_name',LANG))
  else
    break
  end
end

num1 = ''
num2 = ''
operator = ''

prompt("Hi, #{name}!")

loop do
  loop do
    prompt(messages('input1', LANG))
    num1 = Kernel.gets().chomp() #the scope of num1 is not visible outside the loop block

    if valid_number?(num1)
      break
    else
      prompt(messages('valid_number', LANG))
    end
  end

  loop do
    prompt(messages('input2', LANG))
    num2 = Kernel.gets().chomp()

    if valid_number?(num2)
      break
    else
      prompt(messages('valid_number', LANG))
    end
  end

  prompt(messages('operator_prompt', LANG))

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include? operator
      break
    else
      prompt(messages('valid_selection', LANG))
    end
  end

  prompt "#{operation_to_msg(operator)} the two numbers..."

  result =  case operator
            when '1'
              result = num1.to_f() + num2.to_f()
            when '2'
              result = num1.to_f() - num2.to_f()
            when '3'
              result = num1.to_f() * num2.to_f()
            when '4'
              result = num1.to_f() / num2.to_f()
            end

  prompt "The result is #{result}"

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp
  break unless answer.downcase().start_with?('y')
end

prompt("#{name}, Thank you for using the calculator!")