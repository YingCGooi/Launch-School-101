# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

#You should initialize the register to 0.

# ")3 % 5( / )7 - )5 * 4( + 3("

OPERATOR = {
  '+' => 'ADD ',
  '-' => 'SUB ',
  '*' => 'MULT ',
  '/' => 'DIV ',
  '%' => 'MOD '
}.freeze

def minilang_math(expression)
  minilang_str = ''

  # initialize a nested array to store OPERATOR values...
  buffers = [[]]

  # initialize the index of nested array
  current = 0

  expression.delete(' ').reverse.chars.map do |command|
    case command
    when '+', '-', '*', '/', '%'
      buffers[current] << OPERATOR[command]
      minilang_str << 'PUSH '

    when ')'
      current += 1
      buffers[current] = []

    when '('
      buffers[current].size.times { minilang_str << buffers[current].pop}
      current -= 1

    else
      if command.to_i.to_s != command
        break puts "INVALID COMMAND '#{command}' DETECTED"
      end
      minilang_str << "#{command} "
    end

    buffers_align = buffers.to_s.ljust(32)
    puts " #{command} | #{current} | #{buffers_align} | '#{minilang_str}'"
  end
  buffers[0].size.times { minilang_str << buffers[current].pop}

  minilang_str << 'PRINT'
  p minilang_str

  minilang(minilang_str)
end

def minilang(commands)
  stack = []
  register = 0
  commands.split(' ').each do |command|
    case command.upcase
    when 'PUSH' then stack << register
    when 'ADD'  then register += stack.pop
    when 'SUB'  then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV'  then register /= stack.pop
    when 'MOD'  then register %= stack.pop
    when 'POP'  then register = stack.pop
    when 'PRINT'then puts register
    else
      if command.to_i.to_s == command
        register = command.to_i
      else
        break puts "INVALID COMMAND '#{command}' DETECTED"
      end
    end rescue puts "ERROR - CANNOT PERFORM OPERATION ON EMPTY STACK"
  end
  puts "--------"
end

minilang('MULT PRINT')

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')

minilang('5 PUSH POP PRINT')

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')

minilang('-3 PUSH 5 SUB PRINT')

minilang('6 PUSH')

minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PUSH PRINT')

minilang('1 PUSH 2 SUB PRINT')

minilang('1 TEST 2 PUSH 3 PUSH 4 SUB MULT ADD PRINT')

minilang('1 PUSH 2 PUSH 3 MULT PUSH 4 SUB ADD PRINT')

minilang_math('(3 + (4 * 5) - 7) / (5 % 3)')
