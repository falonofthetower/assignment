# mortgage_calculator.rb
require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(text)
  puts "=> #{text}"
end

def integer?(int)
  Integer(int) rescue false
end

def float?(decimal)
  Float(decimal) rescue false
end

def number?(number)
  integer?(number) || float?(number)
end

def monthly_payment(p, j, n)
  payment = p.to_f * (j.to_f / (1 - (1 + j.to_f)**-n.to_i))
end

def monthly_interest_rate(yearly_interest_rate)
  monthly_rate = yearly_interest_rate.to_f/12
end

def number_months(number_years)
  months = number_years.to_i * 12
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['principle'])
principle = gets.chomp

loop do
  if number?(principle)
    break
  else
    prompt(MESSAGES['valid'])
    prompt(MESSAGES['principle'])
    principle = gets.chomp
  end
end

prompt(MESSAGES['interest'])
interest_rate = gets.chomp

loop do
  if number?(interest_rate)
    break
  else
    prompt(MESSAGES['valid'])
    prompt(MESSAGES['interest'])
    interest_rate = gets.chomp
  end
end

prompt(MESSAGES['duration'])
years = gets.chomp

loop do
  if integer?(years)
    break
  else
    prompt(MESSAGES['valid'])
    prompt(MESSAGES['duration'])
    years = gets.chomp
  end
end
monthly_interest = monthly_interest_rate(interest_rate)/100
number_months = number_months(years)
puts monthly_payment(principle, monthly_interest, number_months).round(2)


