# Известно, что любое натуральное число можно представить в виде суммы не более
# чем четырех квадратов натуральных чисел или, что то же самое, в виде суммы 
# четырех квадратов неотрицательныхцелых чисел (теорема Лагранжа). 
# Дано натуральное n; 
# указать такие неотрицательные x,y,z,t,что n = x 2 + y 2 + z 2 + t 2
# 3 = 1^2 + 1^2 + 1^2 + 0^2
# 31 = 5^2 + 2^2 + 1^2 + 1^2
# 310 = 17^2 + 4^2 + 2^2 + 1^2

def lagrange(n)
  puts "Lagrange's"
  i = 0
  #while
    square = []
    minus = 4.to_f
    i=0
    a, b, c, d = nil, nil, nil, nil
    loop do
    a = square[0].nil? ? a = nil : square[0]
    b = square[1].nil? ? b = nil : square[1]
    c = square[2].nil? ? c = nil : square[2]
    max_num = Math.sqrt(n-(a.to_i**2)-(b.to_i**2)).to_i
    max_num = Math.sqrt(n-(a**2)-(b**2)-(c**2)) if i == 3
    if i == 3 && max_num % 1 != 0
      # p max_num
      c = max_num.to_i
      d = Math.sqrt(n-(a**2)-(b**2)-(c**2))
      while d % 1 != 0
      d = Math.sqrt(n-(a**2)-(b**2)-(c**2))
      c += 1
      end
      square[3] = d.to_i
    end
    square << max_num.to_i if i == 3
    min_num = nil
    tmp = (1..max_num).to_a
    minus = 3.to_f unless a.nil?
    minus = 2.to_f unless b.nil?
    minus = 1.to_f unless c.nil?
    min_num = tmp.find { |num| num**2 >= (n-(a.to_i**2)-(b.to_i**2)).to_f/minus }
    # p min_num
    square << min_num
    break if i > 2
       i += 1
    end
    puts square[0,4]
end

  # some code here 2346
 
lagrange(5)
