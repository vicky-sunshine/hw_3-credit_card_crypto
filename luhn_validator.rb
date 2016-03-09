module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i).reverse!
    double = nums_a.each_with_index.map do |e, i|
      if i.even? && e > 4
        e * 2 - 9
      else
        i.even? ? e * 2 : e
      end
    end
    double.reduce(:+) % 10 == 0
  end
end
