class Bank
  def reduce(source, to)
    amount = source.augend.amount + source.addend.amount
    Money.new(amount, to)
  end
end
