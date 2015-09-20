class Dollar < Money
  def times(multiplier)
    Dollar.new(@amount * multiplier, currency)
  end
end
