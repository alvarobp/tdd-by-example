class Money
  def ==(other)
    amount == other.amount
  end

  protected
  attr_reader :amount
end
