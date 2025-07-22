class StrCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    nums = numbers.split(/[\n,]/)
    negatives = []
    sum = 0

    nums.each do |num|
      n = num.to_i
      if n < 0
        negatives << n
      else
        sum += n
      end
    end

    raise ArgumentError.new("negative numbers not allowed: #{negatives.join(', ')}") if negatives.any?

    sum
  end
end
