class Franc < Money
  def times(multiplier)
    Franc.new(@amount * multiplier, currency)
  end
end
