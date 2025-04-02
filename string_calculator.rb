class StringCalculator
  DEFAULT_DELIMITER = /,|\n/.freeze # Default delimiters: comma `,` or newline `\n`

  def add(str)
    return 0 if str.empty?

    custom_delimiter, input = extract_inputs(str)
    delimiter = custom_delimiter || DEFAULT_DELIMITER

    numbers = parse_numbers(input, delimiter)
    validate_numbers(numbers)

    numbers.sum
  end

  private

  # extract custom delimiter & input numbers
  def extract_inputs(str)
    return [nil, str] unless str.start_with?("//")

    parts = str.split("\n", 2)
    delimiter = parts[0][2]
    input = parts[1]

    [delimiter, input]
  end

  # Parse numbers from the input string using the given delimiter
  def parse_numbers(input, delimiter)
    input.split(delimiter).map(&:to_i)
  end

  # Validate numbers (e.g., check for negatives)
  def validate_numbers(numbers)
    negative_numbers = numbers.select { |n| n < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?
  end
end
