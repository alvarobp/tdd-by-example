require_relative '../src/money'
require_relative '../src/bank'
require_relative '../src/sum'

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

  it 'returns a Sum from plus' do
    five = Money.dollar(5)
    sum = five.plus(five)
    expect(sum.augend).to eq(five)
    expect(sum.addend).to eq(five)
  end

  it 'supports reduced addition' do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, 'USD')
    expect(result).to eq(Money.dollar(7))
  end

  it 'supports reducing with Money' do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), 'USD')
    expect(result).to eq(Money.dollar(1))
  end

  it 'supports reducing Money in different currency' do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(Money.franc(2), 'USD')
    expect(result).to eq(Money.dollar(1))
  end
end
