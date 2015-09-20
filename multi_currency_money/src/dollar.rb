class Dollar < Money
  attr_reader :currency

  def initialize(amount)
    @amount = amount
    @currency = 'USD'
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end
end
