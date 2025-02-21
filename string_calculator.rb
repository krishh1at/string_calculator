class StringCalculator
  def add(input)
    0 if input.empty?

    delimiter = /,|\n/  # Default delimiters: comma `,` or newline `\n`

    # Custom delimiter
    if input.start_with?("//")
      parts = input.split("\n", 2)
      delimiter = parts[0][2]
      input = parts[1]
    end

    # Split input string by delimiter and convert to integers
    numbers = input.split(delimiter).map(&:to_i)

    # Negative numbers not allowed
    negative_numbers = numbers.select { |n| n < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negative_numbers.join(", ")}" if negative_numbers.any?

    numbers.sum
  end
end
