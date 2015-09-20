require_relative '../src/dollar'

describe 'Multi-Currency Money' do
  it 'supports multiplication' do
    five = Dollar.new(5)
    five.times(2)
    expect(five.amount).to eq(10)
  end
end
