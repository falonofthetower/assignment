# calculator.rb
require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def float?(decimal)
  Float(decimal) rescue nil
end

def integer?(int)
  Integer(int) rescue nil
end

def number?(test)
  integer?(test) || float?(test)
end
prompt(MESSAGES['welcome'])
prompt(MESSAGES['enter_name'])
name = Kernel.gets().chomp()

def choice(select)
stored = case select
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Mutiplying'
  when '4'
    'Dividing'
  end
stored
end

loop do # name validation
  if name.empty?()
    prompt(MESSAGES['enter_name'])
    name = Kernel.gets().chomp()
  else
    prompt("Hello #{name}!")
    break
  end
end

loop do # main loop
selection_prompt = <<-MES
Please press:
1. Addition
2. Subtraction
3. Mutiplication
4. Division
MES

prompt(selection_prompt)
selection = Kernel.gets().chomp()

until (1..4).include?(selection.to_i())
  prompt(MESSAGES['valid_input'])
  prompt(selection_prompt)
  selection = Kernel.gets().chomp()
end

number1 = ''
number2 = ''

loop do
  prompt(MESSAGES['enter_first_number'])
  number1 = Kernel.gets().chomp()
  if number?(number1)
    break
  else
    prompt(MESSAGES['valid_input'])
  end
end

loop do
  prompt(MESSAGES['enter_second_number'])
  number2 = Kernel.gets().chomp()
  if number?(number2)
    break
  else
    prompt(MESSAGES['valid_input'])
  end
end

results = case selection
          when '1'
            number1.to_i() + number2.to_i()
          when '2'
            number1.to_i() - number2.to_i()
          when '3'
            number1.to_i() * number2.to_i()
          when '4'
            number1.to_f() / number2.to_f()
          end
prompt("#{choice(selection)} #{number1} and #{number2} is #{results}")
prompt(MESSAGES['another_calculation'])
reply = Kernel.gets().chomp()
break unless reply.downcase().start_with?('y')
end

prompt(MESSAGES['thanks'])

=begin
if selection == '1'
  answer = number1.to_i() + number2.to_i()
  Kernel.puts(answer)
elsif selection == '2'
  answer = number1.to_i() - number2.to_i()
  Kernel.puts(answer)
elsif selection == '3'
  answer = number1.to_i() * number2.to_i()
  Kernel.puts(answer)
else
  answer = number1.to_f() / number2.to_f()
  Kernel.puts(answer)
end
=end

