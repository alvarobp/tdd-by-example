class Franc < Money
  def initialize(amount, currency)
    @amount = amount
    @currency = 'CHF'
  end

  def times(multiplier)
    Money.franc(@amount * multiplier)
  end
end
