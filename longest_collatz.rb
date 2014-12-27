def next_collatz(n)
  if n.even?
    return n/2
  else
    return 3*n + 1
  end
end

def collatz_sequence_length(n)
  sequence_length = 1
  current_num = n
  until current_num == 1
    next_num = next_collatz(current_num)
    sequence_length += 1
    current_num = next_num
  end
  sequence_length
end

# puts collatz_sequence_length(13)
# => 10

def longest_collatz_sequence_under(n)
  longest_sequence = 0
  winner = nil
  (1..n-1).each do |n|
    sequence_length = collatz_sequence_length(n)
    if sequence_length > longest_sequence
      longest_sequence = sequence_length
      winner = n
    end
  end
  winner
end

puts longest_collatz_sequence_under(1000000)