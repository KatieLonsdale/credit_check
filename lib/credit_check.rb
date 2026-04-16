card_number = "5541808923795240"

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

def sum_digits(double_numbers)
  double_numbers.map do |num|
    num > 9 ? num.digits.sum : num
  end
end

def sum_all_digits(summed_numbers)
  summed_numbers.sum
end

def divisible_by_ten?(sum)
  sum % 10 == 0 ? true : false
end

def return_message(card_number, result)
  valid_message = "The number #{card_number} is valid!"
  invalid_message = "The number #{card_number} is invalid!"
  result ? valid_message : invalid_message
end

def validate_account_number(card_number)
  double_numbers = double_digits(card_number)
  summed_numbers = sum_digits(double_numbers)
  sum = sum_all_digits(summed_numbers)
  result = divisible_by_ten?(sum)
  return_message(card_number, result)
end

p validate_account_number(card_number)