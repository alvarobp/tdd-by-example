class Franc < Money
  def times(multiplier)
    Franc.new(@amount * multiplier, 'CHF')
  end
end
