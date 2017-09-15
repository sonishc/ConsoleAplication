# Add desc then add def function without parameters
class Tasks < Thor
  desc 'occurrence_number', 'Finding user number in n^2 sequence'
  def occurrence_number
    n = ask('Enter number to squared', color = "\e[1m").to_i
    user_number = ask('Enter the search value', color = "\e[1m")
    result = (n**2).to_s.split('').include?(user_number)
    word = 'no ' unless result
    puts "#{n**2} - This sequence has #{word}number #{user_number}"
  end

  desc 'abramov_322', 'Returns a MAX SUM DIVIDES numbers within all natural'
  def abramov_322
    say('Enter last number of range', color = "\e[43m")
    n = ask("\n Enter number", color = "\e[1m").to_i
    puts " Max element in result array =  #{summ_divides(n).max}"
  end

  desc 'perfects_num', 'Get All perfect numbers < n'
  def perfects_num
    say('Enter the number to get all perfect numbers', color = "\e[43m")
    n = ask("\n Enter number = ", color = "\e[1m").to_i
    numbers = (1..n).to_a
    result_array = summ_divides(n)
    result = []
    result_array.each_index do |i|
      result << result_array[i] if numbers[i] == result_array[i]
    end
    puts " Result = #{result}"
  end

  desc 'fibonacci', 'Sequence fibonacci'
  def fibonacci
    say('Enter number for the sequence fibonacci', color = "\e[43m")
    n = ask("\n N = ").to_i
    fib = [0, 1]
    n >= 1 ? (n - 1).times { fib << fib.last + fib[fib.length - 2] } : fib.pop
    puts "\n Result = #{fib}"
  end

  def summ_divides(n)
    (1..n).map do |number|
      (1..number).select { |value| (number % value).zero? && value != number }.sum
    end
  end

end
