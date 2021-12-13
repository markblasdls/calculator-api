require 'rails_helper'

RSpec.describe CalculatorService, type: :service do
  subject(:sum) { described_class.new(number_a: 1, number_b: 1, operation: 'SUM') }
  subject(:sub) { described_class.new(number_a: 1, number_b: 1, operation: 'SUB') }
  subject(:times) { described_class.new(number_a: 1, number_b: 1, operation: 'TIMES') }
  subject(:divide) { described_class.new(number_a: 1, number_b: 1, operation: 'DIVIDE') }
  subject(:invalid_1) { described_class.new(number_a: 1, number_b: 1, operation: '') }
  subject(:invalid_2) { described_class.new(number_a: 1, number_b: 'ABC', operation: 'SUM') }
  subject(:invalid_3) { described_class.new(number_a: 'ABC', number_b: 'ABC', operation: 'ABC') }
  subject(:invalid_4) { described_class.new }

  context '#valid_number?' do
    it 'should check for if values are valid numbers' do
      expect(sum.valid_number?).to eq(true)
      expect(sub.valid_number?).to eq(true)
      expect(divide.valid_number?).to eq(true)
      expect(invalid_1.valid_number?).to eq(true)
      expect(invalid_2.valid_number?).to eq(false)
      expect(invalid_3.valid_number?).to eq(false)
      expect { invalid_4.valid_number? }
        .to raise_exception(StandardError)
    end
  end

  context '#valid_operation?' do
    it 'should check for if values are valid numbers' do
      expect(sum.valid_operation?).to eq(true)
      expect(sub.valid_operation?).to eq(true)
      expect(divide.valid_operation?).to eq(true)
      expect(invalid_1.valid_operation?).to eq(false)
      expect(invalid_2.valid_operation?).to eq(true)
      expect(invalid_3.valid_operation?).to eq(false)
      expect { invalid_4.valid_operation? }
        .to raise_exception(StandardError)
    end
  end

  context '#result' do
    it 'should check for the result' do
      expect(sum.result).to eq(2.0)
      expect(sub.result).to eq(0.0)
      expect(divide.result).to eq(1.0)
      expect { invalid_1.result }
        .to raise_exception(CalculatorService::InvalidOperation)
      expect { invalid_2.result }
        .to raise_exception(CalculatorService::InvalidNumber)
      expect { invalid_3.result }
        .to raise_exception(CalculatorService::InvalidOperation)
      expect { invalid_4.result }
        .to raise_exception(StandardError)
    end
  end
end
