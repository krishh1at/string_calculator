class StringCalculator
  DEFAULT_DELIMITER = /,|\n/.freeze # Default delimiters: comma `,` or newline `\n`

  def add(str)
    return 0 if str.empty?

    custom_delimiter, input = extract_inputs(str)
    delimiter = custom_delimiter || DEFAULT_DELIMITER

    # Split input string by delimiter and convert to integers
    numbers = input.split(delimiter).map(&:to_i)

    # Negative numbers not allowed
    negative_numbers = numbers.select { |n| n < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negative_numbers.join(", ")}" if negative_numbers.any?

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
end
