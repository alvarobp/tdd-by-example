require_relative 'expression'

class Sum
  include Expression

  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount +
      addend.reduce(bank, to).amount
    Money.new(amount, to)
  end
end
