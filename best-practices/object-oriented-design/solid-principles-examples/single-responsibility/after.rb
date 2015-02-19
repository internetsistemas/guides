# Now there is a new class to calculate the discount
class Product
  attr_reader :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  def price_with_discount
    DiscountCalculator.new(price).calculate
  end
end

class DiscountCalculator
  DiscountPercentage = 0.90
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def calculate
    value * DiscountPercentage
  end
end
