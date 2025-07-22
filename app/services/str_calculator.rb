class StrCalculator
  def add(numbers)
    return 0 if numbers.empty?
    nums = numbers.split(',')
    nums.map(&:to_i).sum
  end
end
