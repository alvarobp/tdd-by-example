class Money
  attr_reader :currency

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount, 'CHF')
  end

  def times
    raise 'Implement in subclass'
  end

  def ==(other)
    amount == other.amount &&
      self.class == other.class
  end

  protected
  attr_reader :amount
end
