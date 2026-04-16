card_number = "5541808923795240"

def double_every_other_digit(card_number)
  double_numbers = []
  card_number.split("").each_with_index do |num, i|
    i.even? ? double_numbers << num.to_i * 2 : double_numbers << num.to_i
  end
  double_numbers
end

def sum_digits_greater_than_nine(double_numbers)
  double_numbers.map { |num| num > 9 ? num.digits.sum : num }
end

def divisible_by_ten?(sum)
  sum % 10 == 0 ? true : false
end

def return_message(card_number, result)
  result ? "The number #{card_number} is valid!" : "The number #{card_number} is invalid!"
end

def validate_account_number(card_number)
  double_numbers = double_every_other_digit(card_number)
  summed_numbers = sum_digits_greater_than_nine(double_numbers)
  result = divisible_by_ten?(summed_numbers.sum)
  return_message(card_number, result)
end

p validate_account_number(card_number)