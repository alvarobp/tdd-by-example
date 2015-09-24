require_relative 'expression'

class Sum
  include Expression

  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank, to)
    amount = augend.amount + addend.amount
    Money.new(amount, to)
  end
end
