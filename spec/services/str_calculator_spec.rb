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

    it 'throws an error for negative numbers' do
      calculator = StrCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error(ArgumentError, "negative numbers not allowed: -2")
    end

    it 'throws an error for multiple negative numbers' do
      calculator = StrCalculator.new
      expect { calculator.add("1,-2,-3") }.to raise_error(ArgumentError, "negative numbers not allowed: -2, -3")
    end

    it 'supports custom delimiters' do
      calculator = StrCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'supports delimiters with multiple characters' do
      calculator = StrCalculator.new
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'supports multiple delimiters' do
      calculator = StrCalculator.new
      expect(calculator.add("//[;][,]\n1;2,3")).to eq(6)
    end

    it 'handles multiple newlines correctly' do
      calculator = StrCalculator.new
      expect(calculator.add("1\n\n2\n3")).to eq(6)
    end

    it 'raises an error for non-numeric values' do
      calculator = StrCalculator.new
      expect(calculator.add("1,2,abc")).to eq(3)
    end
  end
end
