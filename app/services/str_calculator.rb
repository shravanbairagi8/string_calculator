class StrCalculator
  def add(numbers)
    return 0 if numbers.empty?

    # Check for custom delimiter declaration
    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1]  # Remove the '//' part

      # Handle multiple delimiters
      if delimiter.include?("[")
        delimiters = delimiter.scan(/\[([^\]]+)\]/).flatten
        nums = numbers.split(Regexp.union(delimiters))
      else
        nums = numbers.split(delimiter)
      end
    else
      # Default behavior (split by comma or newline)
      nums = numbers.split(/[\n,]/)
    end

    # Process the numbers
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

    # Raise an exception if negative numbers are found
    raise ArgumentError.new("negative numbers not allowed: #{negatives.join(', ')}") if negatives.any?

    sum
  end
end
