class  Counter < Thor

  desc "occurrence_number", "Finding number 3 in n^2 sequence"
  def occurrence_number # Finding number 3 in n^2 sequence
    n = ask("Enter number to squared", color = "\e[1m").to_i
    number_three = ask("Enter the search value", color = "\e[1m")
    num = (n**2).to_s # Convert to String
    n = (n**2).to_s.split('') # Divide string to array
    p number_three
    n = n.select { |i| i == number_three } # Select number_three in n - array
    if n.empty?
      puts num + " - This sequence has no number #{number_three}"
    else
      puts num + " - This sequence has number #{number_three}"
    end
  end

  ##############

  desc "abramov_322", "Returns a MAX SUM DIVIDES numbers within all natural"
  def abramov_322
  puts 'Write last number of range'

  n = ask("Enter number", color = "\e[1m").to_i # Get user data
  numbers = (1..n).to_a   # Convert range to array

  arr = numbers.map do |number| # Create result array witch contains sum divedes
    a = (1..number).select { |value| (number % value).zero? && value != number }
    a.inject(0) { |sum, x| sum + x }
  end
  puts 'Max element in result array'
  p arr.inject { |m, x| m > x ? m : x } # Get max element in result array
  end

  ##############

  desc "perfects_num", "Get All perfect numbers < n"
  def perfects_num # Get All perfect numbers < n
  puts 'Write the number to get all perfect numbers'
  n = ask("Enter number", color = "\e[1m").to_i
  numbers = (1..n).to_a # Convert range to array
  arr = numbers.map do |number| # Create result array witch contains sum divedes
    a = (1..number).select { |k| (number % k).zero? && k != number }
    a.inject(0) { |sum, x| sum + x }
  end
  result = []
  arr.each_with_index do |_, i|
    if numbers[i] == arr[i] then result << arr[i] end # Compare to value range 
  end
  puts result # Convert array to string
  end

  ##############
  desc "one", "Put string for test"
  def one
    str = ask("Enter the string", color = "\e[1m")
    puts str
  end
  end