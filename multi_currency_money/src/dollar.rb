class Dollar < Money
  def times(multiplier)
    Money.dollar(@amount * multiplier)
  end
end
