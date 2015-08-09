# Collatz conjecture: Take any natural number n. If n is even, divide it by 2 to get n / 2. If n is odd, multiply it by 3 and add 1 to obtain 3n + 1. Repeat the process until you reach 1.

# The collatz sequence for any given number is the sequence of numbers you get when following the steps described above until you reach 1. For example, the collatz sequence for 2 is [2, 1]. The collatz sequence for 3 is [3, 10, 5, 16, 8, 4, 2, 1].

# Write a method, #longest_collatz, that takes a number n and returns the number between 1 and n that has the longest collatz sequence (the greatest number of steps to get to 1).

class Collatz
  attr_accessor :sequence

  def initialize
    @sequence = []
  end

  def next_collatz(n)
    if n == 1
      n
    elsif n % 2 == 0
      n / 2
    else
      n * 3 + 1
    end
  end

  def collatz_sequence_for_num(num)
    sequence << num
    if num == 1
      result = sequence.dup
      sequence.clear
      return result
    else
      collatz_sequence_for_num(next_collatz(num))
    end
  end

  def longest_collatz(num)
    longest_sequence_length_so_far = 0
    num_with_longest_sequence_so_far = nil

    (1..num).each do |n|
      current_num_sequence_length = collatz_sequence_for_num(n).length
      if current_num_sequence_length > longest_sequence_length_so_far
        longest_sequence_length_so_far = current_num_sequence_length
        num_with_longest_sequence_so_far = n
      end
    end

    num_with_longest_sequence_so_far
  end
end

require 'rspec'

describe "Collatz::next_collatz" do
  let(:collatz) { Collatz.new }
  it "returns the next collatz number correctly" do
    expect(collatz.next_collatz(1)).to eq(1)
    expect(collatz.next_collatz(3)).to eq(10)
    expect(collatz.next_collatz(8)).to eq(4)
  end
end

describe "Collatz::collatz_sequence_for_num" do
  let(:collatz) { Collatz.new }
  it "returns the correct collatz sequence for 1" do
    expect(collatz.collatz_sequence_for_num(1)).to eq([1])
  end

  it "returns the correct collatz sequence for numbers greater than 1" do
    expect(collatz.collatz_sequence_for_num(3)).to eq([3, 10, 5, 16, 8, 4, 2, 1])
    expect(collatz.collatz_sequence_for_num(5)).to eq([5, 16, 8, 4, 2, 1])
  end
end

describe "Collatz::longest_collatz" do
  let(:collatz) { Collatz.new }
  it "given n, returns the number with the longest collatz sequence between 1 and n" do
    expect(collatz.longest_collatz(1)).to eq(1)
    expect(collatz.longest_collatz(3)).to eq(3)
    expect(collatz.longest_collatz(5)).to eq(3)
  end
end
