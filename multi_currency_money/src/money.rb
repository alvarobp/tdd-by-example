class Money
  def ==(other)
    amount == other.amount &&
      self.class == other.class
  end

  protected
  attr_reader :amount
end
