class CalculatorService
  InvalidOperation = Class.new(StandardError)
  InvalidNumber = Class.new(StandardError)

  def initialize(number_a:, number_b:, operation:)
    @operation = operation
    @number_a = number_a
    @number_b = number_b
  end

  def valid_number?
    numeric?(@number_a) && numeric?(@number_b)
  end

  def valid_operation?
    %w[SUM SUB TIMES DIVIDE].include?(@operation)
  end

  def result
    calculate
  end

  private

  def calculate
    raise(InvalidOperation, 'Invalid Operator') unless valid_operation?
    raise(InvalidNumber, 'Invalid or missing Values') unless valid_number?

    a = @number_a.to_f.round(2)
    b = @number_b.to_f.round(2)

    case @operation
    when 'SUM'
      a + b
    when 'SUB'
      a - b
    when 'TIMES'
      a * b
    when 'DIVIDE'
      return 0 if b.zero?

      a / b
    else
      raise(InvalidOperation, 'Invalid Operator')
    end
  end

  def numeric?(string)
    !!Kernel.Float(string)
  rescue TypeError, ArgumentError
    false
  end
end
