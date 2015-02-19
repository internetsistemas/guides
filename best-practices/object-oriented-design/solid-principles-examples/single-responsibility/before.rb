# Product class has calculation for discount value,
# If is necessary change the discount amount from 10% to 20% or change the rule you need to change this class,
# Product should not know this logic, just only know about product attributes and behavior.
class Product
  attr_reader :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  # Need move to other class.
  def price_with_discount
    @price * 0.90
  end
end
