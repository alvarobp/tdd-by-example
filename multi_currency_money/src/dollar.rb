class Dollar < Money
  def times(multiplier)
    Dollar.new(@amount * multiplier, 'USD')
  end
end
