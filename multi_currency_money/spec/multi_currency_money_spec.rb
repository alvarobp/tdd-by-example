require_relative '../src/money'
require_relative '../src/dollar'
require_relative '../src/franc'

describe 'Multi-Currency Money' do
  it 'supports multiplication' do
    five = Money.dollar(5)
    expect(five.times(2)).to eq(Money.dollar(10))
    expect(five.times(3)).to eq(Money.dollar(15))
  end

  it 'supports equality' do
    expect(Money.dollar(5)).to eq(Money.dollar(5))
    expect(Money.dollar(5)).not_to eq(Money.dollar(6))
    expect(Money.franc(5)).to eq(Money.franc(5))
    expect(Money.franc(5)).not_to eq(Money.franc(6))
    expect(Money.franc(5)).not_to eq(Money.dollar(5))
  end

  it 'supports franc multiplication' do
    five = Money.franc(5)
    expect(five.times(2)).to eq(Money.franc(10))
    expect(five.times(3)).to eq(Money.franc(15))
  end
end
