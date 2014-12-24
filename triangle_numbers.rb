# 1
# 1 + 2 = 3
# 1 + 2 + 3 = 6
# 1 + 2 + 3 + 4 = 10
# 1 + 2 + 3 + 4 + 5 = 15

def triangle_number_with_gt_n_divisors(n)
  triangle_number = 1
  num_to_add = 2
  while divisors(triangle_number) <= n
    triangle_number = triangle_number + num_to_add
    num_to_add += 1
  end
  triangle_number
end

def divisors(number)
  if number <= 0
    return 0
  elsif number == 1
    return 1
  else
    divisors = 2
    (2..Math.sqrt(number).floor).each do |candidate|
      if number % candidate == 0
        divisors += 2
      end
    end
    if Math.sqrt(number).floor * Math.sqrt(number).floor == number
      divisors -= 1
    end
    divisors
  end
end

puts triangle_number_with_gt_n_divisors(500)

