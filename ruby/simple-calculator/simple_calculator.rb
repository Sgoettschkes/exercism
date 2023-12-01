class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    if (not first_operand.is_a? Integer) or (not second_operand.is_a? Integer) then
      raise ArgumentError
    end

    unless ALLOWED_OPERATIONS.include? operation then
      raise SimpleCalculator::UnsupportedOperation
    end

    if operation == '/' and second_operand == 0 then
      return "Division by zero is not allowed."
    end
    
    if operation == "+" then
      result = first_operand + second_operand
    elsif operation == "/" then
      result = first_operand / second_operand
    else
      result = first_operand * second_operand
    end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end

  class UnsupportedOperation < StandardError
  end
end
