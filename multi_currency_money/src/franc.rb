class Franc < Money
  def initialize(amount, currency)
    @amount = amount
    @currency = 'CHF'
  end

  def times(multiplier)
    Franc.new(@amount * multiplier, nil)
  end
end
