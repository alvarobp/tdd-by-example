class Dollar < Money
  def initialize(amount)
    @amount = amount
  end

  def currency
    'USD'
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end
end
