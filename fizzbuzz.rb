require 'rspec'

def fizz_buzz(num)
  if num % 15 == 0
    "FizzBuzz"
  elsif num % 3 == 0
    "Fizz"
  elsif num % 5 == 0
    "Buzz"
  else
    num
  end 
end

describe '#fizz_buzz' do
  it "returns 'FizzBuzz' for numbers divisible by 3 and 5" do
    expect(fizz_buzz(15)).to eq("FizzBuzz")
    expect(fizz_buzz(30)).to eq("FizzBuzz")
    expect(fizz_buzz(45)).to eq("FizzBuzz")
  end

  it "returns 'Fizz' for numbers divisible by 3" do
    expect(fizz_buzz(3)).to eq("Fizz")
    expect(fizz_buzz(27)).to eq("Fizz")
    expect(fizz_buzz(303)).to eq("Fizz")
  end

  it "returns 'Buzz' for numbers divisible by 5" do
    expect(fizz_buzz(5)).to eq("Buzz")
    expect(fizz_buzz(100)).to eq("Buzz")
    expect(fizz_buzz(5060)).to eq("Buzz")
  end

  it "returns the number for numbers not divisible by 3 or 5" do
    expect(fizz_buzz(1)).to eq(1)
    expect(fizz_buzz(22)).to eq(22)
    expect(fizz_buzz(4588)).to eq(4588)
  end
end
