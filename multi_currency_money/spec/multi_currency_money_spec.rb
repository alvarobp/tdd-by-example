require_relative '../src/money'

describe 'Multi-Currency Money' do
  it 'supports multiplication' do
    five = Money.dollar(5)
    expect(five.times(2)).to eq(Money.dollar(10))
    expect(five.times(3)).to eq(Money.dollar(15))
  end

  it 'supports equality' do
    expect(Money.dollar(5)).to eq(Money.dollar(5))
    expect(Money.dollar(5)).not_to eq(Money.dollar(6))
    expect(Money.franc(5)).not_to eq(Money.dollar(5))
  end

  it 'has currency' do
    expect(Money.dollar(1).currency).to eq('USD')
    expect(Money.franc(1).currency).to eq('CHF')
  end

  it 'supports simple addition' do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    expect(reduced).to eq(Money.dollar(10))
  end
end
