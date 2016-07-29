# calculator.rb
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number(test)
  test.to_i.nonzero?()
end
prompt("Welcome to the calcuator program!")
prompt("Please enter your name:")
name = Kernel.gets().chomp()

def choice(select)
  case select
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Mutiplying'
  when '4'
    'Dividing'
  end
end

loop do # name validation
  if name.empty?()
    prompt("Please enter your name:")
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
  prompt("Please enter 1,2,3,4.")
  prompt(selection_prompt)
  selection = Kernel.gets().chomp()
end

number1 = nil
number2 = nil

loop do
  prompt("What is the first number?")
  number1 = Kernel.gets().chomp()
  if valid_number(number1)
    break
  else
    prompt("Error! Please input a valid number.")
  end
end

loop do
  prompt("What is the second number?")
  number2 = Kernel.gets().chomp()
  if valid_number(number2)
    break
  else
    prompt("Error! Please input a valid number.")
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
prompt("Do you want to run another calculation? Type y for yes")
reply = Kernel.gets().chomp()
break unless reply.downcase().start_with?('y')
end

prompt("Thank you for using the calculator program!")

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

