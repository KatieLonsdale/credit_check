class CreditCheck
  attr_reader :card_number, :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def is_valid?
    return false if @card_number.length < 16
    double_numbers = double_every_other_digit(@card_number)
    summed_numbers = sum_digits_greater_than_nine(double_numbers)
    divisible_by_ten?(summed_numbers.sum)
  end

  def last_four
    @card_number[-4..-1]
  end


  #helper methods

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
end