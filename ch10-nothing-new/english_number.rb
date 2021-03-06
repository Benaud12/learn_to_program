def english_number number

  if number == 0
    return 'zero'
  end

  if number < 0 || number - number.to_i > 0
    return 'Please enter a number that isn\'t negative.'
  end


  numString = ''

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  left  = number
  write = left/1000000000000       
  left  = left - write*1000000000000

  if write > 0
    trillions  = english_number write
    numString = numString + trillions + ' trillion'
    if left > 0
      numString = numString + ' '
    end
    if left/1000000000==0 and left/1000000==0 and left/1000==0 and left/100==0 and left>0
    	numString = numString + 'and '
    end
  end

	write = left/1000000000        
  	left  = left - write*1000000000

  if write > 0
    billions  = english_number write
    numString = numString + billions + ' billion'
    if left > 0
      numString = numString + ' '
    end
    if left/1000000==0 and left/1000==0 and left/100==0 and left>0
    	numString = numString + 'and '
    end
  end


  write = left/1000000        
  left  = left - write*1000000

  if write > 0
    millions  = english_number write
    numString = numString + millions + ' million'
    if left > 0
      numString = numString + ' '
    end
    if left/1000==0 and left/100==0 and left>0
    	numString = numString + 'and '
    end
  end

  write = left/1000          
  left  = left - write*1000

  if write > 0
    thousands  = english_number write
    numString = numString + thousands + ' thousand'
    if left > 0
      numString = numString + ' '
    end
    if left/100==0 and left>0
    	numString = numString + 'and '
    end
  end

  write = left/100          
  left  = left - write*100

  if write > 0
    hundreds  = english_number write
    numString = numString + hundreds + ' hundred'
    if left > 0
      numString = numString + ' and '
    end
  end

  write = left/10
  left  = left - write*10

  if write > 0
    if ((write == 1) and (left > 0))
      numString = numString + teenagers[left-1]
      left = 0
    else
      numString = numString + tensPlace[write-1]
    end

    if left > 0
      numString = numString + '-'
    end
  end

  write = left
  left  = 0

  if write > 0
    numString = numString + onesPlace[write-1]
  end

  numString
end

puts english_number 1005302
puts english_number 12
puts english_number 356
puts english_number 128889476
puts (english_number 3000478756).capitalize
puts english_number 1983
puts english_number 299983900098327
