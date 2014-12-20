#[1,2,3,4] [0,0,4,7] => [1,1,2,3,4,4,7]

def merge_sort(array)
  if array.length <= 1
    return array
  else
    left_sub_array = array.slice(0...array.length/2)
    right_sub_array = array.slice(array.length/2...array.length)
    return merge_sorted_arrays(merge_sort(left_sub_array), merge_sort(right_sub_array))
  end
end

def merge_sorted_arrays(arr1, arr2)
  merged_array = []
  arr1_index = 0
  arr2_index = 0
  while arr1_index < arr1.length && arr2_index < arr2.length
    if arr1[arr1_index] > arr2[arr2_index]
      merged_array.push(arr2[arr2_index])
      arr2_index += 1
    else
      merged_array.push(arr1[arr1_index])
      arr1_index += 1
    end
  end
  unfinished_array = arr1_index < arr1.length ? arr1 : arr2
  unfinished_index = arr1_index < arr1.length ? arr1_index : arr2_index
  while unfinished_index < unfinished_array.length
    merged_array.push(unfinished_array[unfinished_index])
    unfinished_index += 1
  end
  merged_array
end