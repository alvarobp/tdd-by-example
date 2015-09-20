class Franc < Money
  attr_reader :currency

  def initialize(amount)
    @amount = amount
    @currency = 'CHF'
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end
end
