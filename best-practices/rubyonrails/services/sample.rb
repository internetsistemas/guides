class PaymentService
  attr_accessor :card, :value

  def initialize(card, value)
    @card = card
    @value = value
  end

  def valid?
    valid_card? && charged?
  end

  def process!
    ActiveRecord::Base.transaction do
      external_payment_service!
    end
  end
end
