require 'rails_helper'

RSpec.describe StrCalculator, type: :service do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StrCalculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number itself for a single number' do
      calculator = StrCalculator.new
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum for multiple numbers' do
      calculator = StrCalculator.new
      expect(calculator.add('1,2,3')).to eq(6)
    end

    it 'supports newlines as separators' do
      calculator = StrCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end
  end
end
