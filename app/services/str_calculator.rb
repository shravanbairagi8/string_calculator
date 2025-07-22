class StrCalculator
  def add(numbers)
    return 0 if numbers.empty?
    nums = numbers.split(/[\n,]/)
    nums.map(&:to_i).sum
  end
end
