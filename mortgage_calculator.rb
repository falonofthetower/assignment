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

def monthly_payment(loan, m_interest, months)
  loan.to_f * (m_interest.to_f / (1 - (1 + m_interest.to_f)**-months.to_i))
end

def monthly_interest_rate(yearly_interest)
  yearly_interest.to_f / 12
end

def number_months(number_years)
  number_years.to_i * 12
end

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['principle'])
  principle = gets.chomp

  loop do
    if number?(principle) && principle.to_f >= 0
      break
    else
      prompt(MESSAGES['not_valid'])
      principle = gets.chomp
    end
  end

  prompt(MESSAGES['interest'])
  interest_rate = gets.chomp

  loop do
    if number?(interest_rate)
      break
    else
      prompt(MESSAGES['not_valid'])
      interest_rate = gets.chomp
    end
  end

  prompt(MESSAGES['duration'])
  years = gets.chomp

  loop do
    if years.to_i > 0 && integer?(years)
      break
    else
      prompt(MESSAGES['not_valid'])
      prompt(MESSAGES['duration'])
      years = gets.chomp
    end
  end

  monthly_interest = monthly_interest_rate(interest_rate) / 100
  months = number_months(years)
  prompt("Principle:  $#{principle}")
  prompt("Interest Rate:  #{interest_rate}%")
  prompt("Monthly payment:\
  $#{monthly_payment(principle, monthly_interest, months).round(2)}")
  prompt(MESSAGES['run_again'])
  break unless gets.chomp.downcase.start_with?('y')
end