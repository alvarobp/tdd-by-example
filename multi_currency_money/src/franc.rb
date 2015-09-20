class Franc < Money
  def initialize(amount)
    @amount = amount
  end

  def currency
    'CHF'
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end
end
