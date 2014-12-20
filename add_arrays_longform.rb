def add_arrays(array1, array2)
  result = []
  carry = false
  while array1.length > 0 && array2.length > 0
    if carry
      next_num = array1.pop + array2.pop + 1
      carry = false
    else
      next_num = array1.pop + array2.pop
    end
    if next_num > 9
      carry = true
    end
    result.unshift(next_num % 10)
  end
  while array_with_elements_left(array1, array2)
    if carry
      next_num = array_with_elements_left(array1, array2).pop + 1
      carry = false
    else
      next_num = array_with_elements_left(array1, array2).pop
    end
    if next_num > 9
      carry = true
    end
    result.unshift(next_num % 10)
  end
  if carry
    result.unshift(1)
  end
  result
end

def array_with_elements_left(array1, array2)
  if array1.count > 0
    array1
  elsif array2.count > 0
    array2
  else
    nil
  end
end