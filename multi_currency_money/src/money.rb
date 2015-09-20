class Money
  def self.dollar(amount)
    Dollar.new(amount)
  end

  def ==(other)
    amount == other.amount &&
      self.class == other.class
  end

  protected
  attr_reader :amount
end
