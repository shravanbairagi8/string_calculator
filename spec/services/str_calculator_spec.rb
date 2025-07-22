require 'rails_helper'

RSpec.describe StrCalculator, type: :service do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StrCalculator.new
      expect(calculator.add('')).to eq(0)
    end
  end
end
