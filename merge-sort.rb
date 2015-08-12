require 'rspec'
require 'pry'

def merge_sort(array)
  if array.length <= 1
    return array
  else
    left_array = array[0...array.length/2]
    right_array = array[array.length/2..-1]
    return merge_sorted_arrays(merge_sort(left_array), merge_sort(right_array))
  end
end

def merge_sorted_arrays(array1, array2)
  sorted_array = []
  
  array1_index = 0
  array2_index = 0

  while array1[array1_index] && array2[array2_index]
    if array1[array1_index] < array2[array2_index]
      sorted_array.push(array1[array1_index])
      array1_index += 1
    else
      sorted_array.push(array2[array2_index])
      array2_index += 1
    end
  end
  if array1[array1_index]
    unfinished_array = array1
    unfinished_index = array1_index
  else
    unfinished_array = array2
    unfinished_index = array2_index
  end

  unfinished_array[unfinished_index..-1].each do |num|
    sorted_array.push(num)
  end

  sorted_array
end

describe '#merge_sort' do
  it "returns a sorted array" do
    unsorted_array = [6, 3, 4, 1, 7, 2, 9, 5, 6]
    expect(merge_sort(unsorted_array)).to eq([1, 2, 3, 4, 5, 6, 6, 7, 9])
  end
end
