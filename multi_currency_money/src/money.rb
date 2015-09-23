require_relative 'expression'

class Money
  include Expression

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

  def reduce(to)
    self
  end

  def ==(other)
    amount == other.amount &&
      currency == other.currency
  end

  attr_reader :amount
end
