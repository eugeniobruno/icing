class Calculator
  def add(*numbers)
    numbers.reduce(:+)
  end

  def multiply(*numbers)
    numbers.reduce(:*)
  end

  def divide(dividend, divisor)
    dividend / divisor
  end
end