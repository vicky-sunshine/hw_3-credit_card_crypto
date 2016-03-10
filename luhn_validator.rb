module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i).reverse!
    sum = nums_a.each_with_index.reduce(0) do |acc, pair|
      element, index = pair
      if index.odd? && element > 4
        acc + element * 2 - 9
      elsif index.odd?
        acc + element * 2
      else
        acc + element
      end
    end
    sum % 10 == 0
  end
end
