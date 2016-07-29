#calculator.rb

Kernel.puts("Welcome to the calcuator program!")
selection = nil
Kernel.puts("Please press:\n1 for addition\n2 for subtraction\n3 for mutiplication\n4 for division")
selection = Kernel.gets().chomp()
Kernel.puts("What is the first number?")
number1 = Kernel.gets().chomp()
Kernel.puts("What is the second number?")
number2 = Kernel.gets().chomp()

if selection == '1'
  answer = number1.to_i() + number2.to_i()
  Kernel.puts(answer)
elsif selection == '2'
  answer = number1.to_i() - number2.to_i()
  Kernel.puts(answer)
elsif selection == '3'
  answer = number1.to_i() * number2.to_i()
  Kernel.puts(answer)
elsif
  answer = number1.to_f() / number2.to_f()
  Kernel.puts(answer)
end

