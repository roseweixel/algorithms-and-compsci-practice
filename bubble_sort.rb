require 'rspec'
require 'pry'

def swap(array, index1, index2)
  swap = array[index1]
  array[index1] = array[index2]
  array[index2] = swap
end

def bubble_sort(array)
  sorted = false
  until sorted
    sorted = true
    array[0...-1].each.with_index do |num, index|
      if num > array[index + 1]
        sorted = false
        swap(array, index, index + 1)
      end
    end
  end
  array
end

describe '#bubble_sort' do
  it "returns a sorted array" do
    unsorted_array = [6, 3, 4, 1, 7, 2, 9, 5, 6]
    expect(bubble_sort(unsorted_array)).to eq([1, 2, 3, 4, 5, 6, 6, 7, 9])
  end
end
