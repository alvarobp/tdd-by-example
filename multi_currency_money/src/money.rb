class Money
  attr_reader :currency

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def ==(other)
    amount == other.amount &&
      currency == other.currency
  end

  protected
  attr_reader :amount
end
