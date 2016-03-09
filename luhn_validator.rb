module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i).reverse
    double = nums_a.each_with_index.map { |e, i| i.even? ? e : e * 2 }
    sum_digit = double.map { |e| e >= 10 ? e / 10 + e - 10 : e }
    sum = sum_digit.reduce(:+)
    sum % 10 == 0
  end
end
