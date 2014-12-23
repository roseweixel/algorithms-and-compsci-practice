# 1
# 1 + 2 = 3
# 1 + 2 + 3 = 6
# 1 + 2 + 3 + 4 = 10
# 1 + 2 + 3 + 4 + 5 = 15

def triangle_number_with_gt_n_divisors(n, triangle_number=1, num_to_add=2)
  if divisors(triangle_number) > n
    return triangle_number
  else
    triangle_number = triangle_number + num_to_add
    num_to_add += 1
    return triangle_number_with_gt_n_divisors(n, triangle_number, num_to_add)
  end
end

def divisors(number)
  if number <= 0
    return 0
  elsif number == 1
    divisors = [1]
  else
    divisors = [1, number]
    (2..number-1).each do |candidate|
      if number % candidate == 0
        divisors << candidate
      end
    end
  end
  divisors.count
end

puts triangle_number_with_gt_n_divisors(10, triangle_number=1, num_to_add=2)