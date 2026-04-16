card_number = "5541808923795240"
valid_message = "The number [card number] is valid!"
invalid_message = "The number [card number] is invalid!"

# Your Luhn Algorithm Here

#double value of every other digit

def double_digits(card_number)
  double_numbers = []
  card_number.split("").each_with_index do |num, i|
    if i.even?
      double_numbers << num.to_i * 2
    else
      double_numbers << num.to_i
    end
  end
  double_numbers
end

# if any num in array > 9, sum digits

def sum_digits(double_numbers)
  double_numbers.map do |num|
    num > 9 ? num.digits.sum : num
  end
end

# take sum of all digits

def sum_all_digits(summed_numbers)
  summed_numbers.sum
end

# check if sum is divisible by ten

def divisible_by_ten?(sum)
  sum % 10 == 0 ? true : false
end

def validate_account_number(card_number)
  double_numbers = double_digits(card_number)
  summed_numbers = sum_digits(double_numbers)
  sum = sum_all_digits(summed_numbers)
  divisible_by_ten?(sum)
end

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"

p validate_account_number(card_number)