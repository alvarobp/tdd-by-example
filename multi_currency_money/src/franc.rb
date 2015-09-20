class Franc < Money
  def times(multiplier)
    Money.franc(@amount * multiplier)
  end
end
