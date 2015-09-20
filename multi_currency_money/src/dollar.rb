class Dollar < Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.dollar(@amount * multiplier)
  end
end
