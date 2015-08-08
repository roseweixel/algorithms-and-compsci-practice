require 'pry'
require 'rspec'

# NO RUBY METHODS except shift, unshift, pop, push
def add_arrays(a, b)
  if !a.is_a?(Array) || !b.is_a?(Array)
    raise ArgumentError
  end
  result = []
  index = -1
  carry = 0
  until !a[index] && !b[index] && carry == 0
    digit_a = a[index] ? a[index] : 0
    digit_b = b[index] ? b[index] : 0
    current_result = digit_a + digit_b + carry
    if current_result > 9
      carry = 1
    else
      carry = 0
    end
    result.unshift(current_result % 10)
    index -= 1
  end
  result
end

describe "#add_arrays" do
  # "arrayified" version of 123 is [1, 2, 3]
  # "integerified" version of [1, 2, 3] is 123
  it "returns an arrayified version of the sum of the integerified versions of the two arrays" do
    a = [1, 5, 7, 3]
    b = [3, 8, 9]

    expect(add_arrays(a, b)).to eq([1, 9, 6, 2])
  end

  it "also works when you always need to carry" do
    a = [9, 9, 9, 9]
    b = [9, 9, 9]

    expect(add_arrays(a, b)).to eq([1, 0, 9, 9, 8])
  end

  it "works with very unbalanced arrays" do
    a = [5]
    b = [3, 4, 6]

    expect(add_arrays(a, b)).to eq([3, 5, 1])
  end

  it "works with empty arrays" do
    a = []
    b = []

    expect(add_arrays(a, b)).to eq([])
  end

  it "raises an error if one of the arguments is not an array" do
    expect{add_arrays("cat", [])}.to raise_error(ArgumentError)
  end
end
