require_relative '../src/dollar'

describe 'Multi-Currency Money' do
  it 'supports multiplication' do
    five = Dollar.new(5)
    product = five.times(2)
    expect(product).to eq(Dollar.new(10))
    product = five.times(3)
    expect(product).to eq(Dollar.new(15))
  end

  it 'supports equality' do
    expect(Dollar.new(5)).to eq(Dollar.new(5))
    expect(Dollar.new(5)).not_to eq(Dollar.new(6))
  end
end
