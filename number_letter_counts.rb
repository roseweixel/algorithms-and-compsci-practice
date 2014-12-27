  ONES = {1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine'}
  TENS = {1 => 'ten', 2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty', 6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety'}
  TEENS = {11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}

def to_words(number)
  if number == 1000
    num_string = 'one thousand'
  else
    num_string = ''
      
    hundreds = number/100
    if hundreds > 0
      num_string << ONES[hundreds] + ' hundred'
      number = number % 100
      if number > 0
        num_string << ' and '
      end
    end

    if number > 0
      if number < 10
        num_string << ONES[number]
      else
        if number == 10
          num_string << 'ten'
        elsif number > 10 && number < 20
          num_string << TEENS[number]
        else
          tens = number/10
          num_string << TENS[tens]
          number = number % 10
          if number > 0
            num_string << ' '
            num_string << ONES[number]
          end
        end
      end
    end

  end
  num_string
end

def number_words_letter_count(n)
  big_string = ''
  (1..n).each do |number|
    big_string << to_words(number)
  end
  big_string.gsub(' ', '').length
end

puts number_words_letter_count(1000)
