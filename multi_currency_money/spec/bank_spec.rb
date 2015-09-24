require_relative '../src/bank'

describe Bank do
  describe 'rate' do
    it 'returns identity rate' do
      expect(Bank.new.rate('USD', 'USD')).to eq(1)
    end
  end
end
